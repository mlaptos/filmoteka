<?php

    $conn = null;

    function initializeConnection(){
        global $conn;

        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "videoteka";

        $conn = new mysqli($servername, $username, $password, $dbname);
        $conn->set_charset('utf8mb4');

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    }

    function loginCheck($email, $pass){
        global $conn;

        $sql =  "SELECT * FROM korisnik WHERE";
        $sql .= " email='".$email."'";
        $sql .= " AND lozinka='".$pass."'";

        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            $_SESSION['email'] = $email;
            return true;
        }
        return false;
    }

  function registerCheck($email, $pass, $first_name, $last_name){
        global $conn;

        $sql =  "SELECT * FROM korisnik WHERE";
        $sql .= " email='".$email."'";

        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            return false;
        }

        $sql  = "INSERT INTO korisnik (ime, prezime, email, lozinka) VALUES ";
        $sql .= "('".$first_name."','".$last_name."','".$email."','".$pass."')";

        if ($conn->query($sql) === TRUE) {
            return true;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

    }

    function listMovies(){
        global $conn;

        $sql  = "SELECT idFilm, naslov, opis, poster FROM film";

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {

            $movies = array();

            while($row = $result->fetch_assoc()) {
                array_push($movies, $row);
            }

            return $movies;

        }else{
            echo '<h1>Na ovoj stranici nisu dostupni filmovi</h1>';
        }
    }

    function getMovieById($id){
        global $conn;

        $sql  = "SELECT * FROM film WHERE idFilm='".$id."'";
        $result = $conn->query($sql);

        if($result->num_rows == 1){
            return $result->fetch_assoc();
        }else{
            return 'No movie with that ID';
        }

    }

    function createMovie($naslov, $redatelj, $glumci, $opis, $trajanje, $blagajna, $poster){
        global $conn;

        $target_dir = "assets/";
        $target_file = $target_dir . basename($poster["name"]);
        move_uploaded_file($poster["tmp_name"], $target_file);

        $sql  = "INSERT INTO film (naslov, redatelj, glumci, opis, trajanje, blagajna, poster) VALUES ";
        $sql .= "('".$naslov."','".$redatelj."','".$glumci."','".$opis."','".$trajanje."','".$blagajna."','".$poster['name']."')";

        if ($conn->query($sql) === TRUE) {
            return true;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    function updateMovie($idFilma, $nazivStupca, $novaVrijednost){
        global $conn;

        $sql  = "UPDATE film SET ".$nazivStupca."='".$novaVrijednost."' ";
        $sql .= "WHERE idfilm='".$idFilma."' ";

        if ($conn->query($sql) === TRUE) {
            return 'izmijenjeno';
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }

    function closeConnection(){
        global $conn;
        $conn->close();
        $conn = null;
    }

?>
