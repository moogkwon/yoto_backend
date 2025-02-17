<?php
/**
 * Description of ConfigModal
 *
 * @author yakov
 */
class ConfigModal extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getValueWithKey($key) {
        $result = $this->db->select("value")
                ->from('tbl_config')
                ->where("config_key = '$key'")
                ->get()
                ->result();
            
        if (count($result) == 0)    return "";
        return $result [0]->value;
    }
}

?>