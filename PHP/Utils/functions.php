<?php

function isUserLoggedIn()
{
    return isset($_SESSION["user"]);
}

function isUserStudent()
{
    return isUserLoggedIn() &&
        $_SESSION["user"]["lavoro"] === "studente";
}

function isUserProfessor()
{
    return isUserLoggedIn() &&
        $_SESSION["user"]["lavoro"] === "professore";
}

function isUserSegretary()
{
    return isUserLoggedIn() &&
        $_SESSION["user"]["lavoro"] === "segreteria";
}

function userLevelForAccess($levelToCompare)
{
    if (!isUserLoggedIn()) {
        return false;
    }

    return $_SESSION["user"]["livello_accesso"] >= $levelToCompare;
}

function userRole()
{
    if(isUserLoggedIn()) {
        return false;
    }
    if(isUserStudent()){
        return "Studente";
    }
    if(isUserProfessor()){
        return "Prof";
    }
    if(isUserSegretary()){
        return "Segretario";
    }
}

?>