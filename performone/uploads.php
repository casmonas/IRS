<?php

session_start();

$message = ''; 

if (isset($_POST['uploadBtn']) && $_POST['uploadBtn'] == 'Upload the File')

{

  if (isset($_FILES['uploadedFile']) && $_FILES['uploadedFile']['error'] === UPLOAD_ERR_OK)

  {

    // uploaded file details

    $fileTmpPath = $_FILES['uploadedFile']['tmp_name'];

    $fileName = $_FILES['uploadedFile']['name'];

    $fileSize = $_FILES['uploadedFile']['size'];

    $fileType = $_FILES['uploadedFile']['type'];

    $fileNameCmps = explode(".", $fileName);

    $fileExtension = strtolower(end($fileNameCmps));

    // removing extra spaces

    $newFileName = md5(time() . $fileName) . '.' . $fileExtension;

    // file extensions allowed

    $allowedfileExtensions = array('jpg', 'gif', 'png', 'zip', 'txt', 'xls', 'doc');

    if (in_array($fileExtension, $allowedfileExtensions))

    {



      // directory where file will be moved

      $uploadFileDir = "../uploads/";

      $dest_path = $uploadFileDir . $newFileName;

      if(move_uploaded_file($fileTmpPath, $dest_path)) 

      {

        $message = 'File uploaded successfully.';

      }

      else 

      {

        $message = 'An error occurred while uploading the file to the destination directory. Ensure that the web server has access to write in the path directory.';

      }

    }

    else

    {

      $message = 'Upload failed as the file type is not acceptable. The allowed file types are:' . implode(',', $allowedfileExtensions);

    }

  }

  else

  {

    $message = 'Error occurred while uploading the file.<br>';

    $message .= 'Error:' . $_FILES['uploadedFile']['error'];

  }

}

$_SESSION['message'] = $message;

header("Location: files.php");

?>