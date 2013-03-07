<?php
App::uses('AuthComponent', 'Controller/Component');
class User extends AppModel {
	public $name = 'User';
	public $displayField = 'name';
	
	/*public $validate = array(
		'username'=>array(
			'Valid email'=>array(
				'rule'=>array('email'),
				'message'=>'Please enter a valid email address'
			)
		),
		'password'=>array(
		    'Not empty'=>array(
		        'rule'=>'notEmpty',
		        'message'=>'Please enter your password'
		    ),
		    'Match passwords'=>array(
		        'rule'=>'matchPasswords',
		        'message'=>'Your passwords do not match'
		    )
		),
		'password_confirmation'=>array(
		    'Not empty'=>array(
		        'rule'=>'notEmpty',
		        'message'=>'Please confirm your password'
		    )
		)
	); */

    public $validate = array(
        'username' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'A username is required'
            )
        ),
        'password' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'A password is required'
            )
        ),
    'password_confirmation'=>array(
		    'Not empty'=>array(
		        'rule'=>'notEmpty',
		        'message'=>'Please confirm your password'
		    )
		)
    );
	
	public function matchPasswords($data) {
	    if ($data['password'] == $this->data['User']['password_confirmation']) {
	        return true;
	    }
	    $this->invalidate('password_confirmation', 'Your passwords do not match');
	    return false;
	}

	public function beforeSave(){

		/*if (isset($this->data['User']['password'])){

			$this->data['User']['password'] = AuthComponent::password($this->data['User']['password']);
		}
		return true;*/

		  if (isset($this->data[$this->alias]['password'])) {
        $this->data[$this->alias]['password'] = AuthComponent::password($this->data[$this->alias]['password']);
    }
    return true;
	}


	
}
?>
