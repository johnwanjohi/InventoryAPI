<?php

namespace classes;

class site_notes
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE site_notes SET 
            site_id=:site_id,
            system_type=:system_type,            
            note=:note,
            modify_date=now(),
            modify_by=:modify_by,
            description=:description,
            id=:id
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getSiteNoteById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO site_notes SET 
            site_id=:site_id,
            system_type=:system_type,
            create_date=now(),
            create_by=:create_by,
            modify_by=:create_by,
            modify_date=now(),
            note=:note,
            description=:description, 
            id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getSiteNoteById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $site_notes=[];
        $this->db->getquery("SELECT site_notes.*,
        sites.name as site,
        system_types.system_type as systemtype
        FROM site_notes
        LEFT JOIN sites ON sites.id = site_notes.site_id
        LEFT JOIN system_types ON system_types.id = site_notes.system_type");
        while ($site_note=$this->db->fetch()) {
            $site_notes[]=$site_note;
        }
        $answer["site_notes"]=$site_notes;
        return json_encode($answer);    
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getSiteNoteById()
    {
        $site_note = [];
        $this->db->getquery("SELECT site_notes.*,
        sites.name as site,
        system_types.system_type as systemtype
        FROM site_notes
        LEFT JOIN sites ON sites.id = site_notes.site_id 
        LEFT JOIN system_types ON system_types.id = site_notes.system_type
        WHERE site_notes.id='" . $this->request->id . "'");
        $site_note = $this->db->fetch();   
        $answer["site_notes"]=$site_note;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// private function __getSiteNoteById($sitenote_id)
//     {
//         $site_note = [];
//         $this->db->getquery("SELECT site_notes.*,
//         sites.name as site,
//         system_types.system_type as systemtype
//         FROM site_notes
//         LEFT JOIN sites ON sites.id = site_notes.site_id 
//         LEFT JOIN system_types ON system_types.id = site_notes.system_type
//         WHERE site_notes.id='" . $sitenote_id . "'");
//         $site_note = $this->db->fetch();
//         return $site_note;
//     }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAllSiteNotesBySiteId()
    {
        $site_notes = [];
        $this->db->getquery("SELECT site_notes.*,
        sites.name as site,
        system_types.system_type as systemtype
        FROM site_notes 
        LEFT JOIN sites ON sites.id = site_notes.site_id 
        LEFT JOIN system_types ON system_types.id = site_notes.system_type
        WHERE site_id='" . $this->request->site_id . "' order by site_notes.id desc");
        while ($site_note = $this->db->fetch()) {
            $site_notes[] = $site_note;
        }
        $answer["site_notes"] = $site_notes;
        return json_encode($answer);
    }   
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM site_notes WHERE id='".$this->request->id."'");
        $answer["status"]="SiteNote record deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteBySiteID($site_id)
    {
        $this->db->getquery("DELETE FROM site_notes WHERE site_id='".$site_id."'");
    }   
}

