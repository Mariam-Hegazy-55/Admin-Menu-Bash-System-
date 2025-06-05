#!/bin/bash

add_user(){
    read -p "Enter username: " name
    if id "$name" &> /dev/null 
    then
        echo -e "This user already exists!\nCannot add it again" 
    else
        sudo useradd -m "$name"
        echo "$name was added successfully"
    fi
}

delete_user(){
    read -p "Enter username: " name
    if id "$name" &> /dev/null
    then
        sudo userdel -r "$name" 
        echo "$name was deleted successfully"
    else
        echo "This user does not exist"
    fi 
}

add_group(){
    read -p "Enter Group Name: " gname
    if grep -q "^$gname:" /etc/group 
    then
        echo -e "\nThis group already exists"
    else
        sudo groupadd "$gname"
        echo "$gname was successfully added"
    fi 
}

delete_group(){
    read -p "Enter Group Name: " gname
    if grep -q "^$gname:" /etc/group 
    then
        sudo groupdel "$gname"
        echo "$gname was deleted successfully"
    else
        echo -e "\nThis group does not exist"
    fi 
}

rename_group(){
    read -p "Enter Group Old Name: " oldname
    read -p "Enter Group New Name: " newname
    if grep -q "^$oldname:" /etc/group
    then
        if grep -q "^$newname:" /etc/group
        then
            echo -e "This new group name already exists\n"
        else
            sudo groupmod -n "$newname" "$oldname"
            echo "$oldname was renamed to $newname successfully"
        fi
    else
        echo -e "\nThe original group does not exist"
    fi
}


user(){
    echo -e "\n Hello To User Menu"
    select u in "Add" "Delete" "Back"
        do 
            case $u in
                "Add")
                    add_user
                    break;;
                "Delete")
                    delete_user
                    break;;
                "Back")
                    return ;;
                *)
                    echo "Invalid Option"
                    break;;
            esac
        done
}

group(){
    echo -e "\n Hello To Group Menu"
    select g in "Add" "Delete" "Rename" "Back"
        do
            case $g in
                "Add")
                    add_group
                    break;;
                "Delete")
                    delete_group
                    break;;
                "Rename")
                    rename_group
                    break;;
                "Back")
                    return ;;
                *)
                    echo "Invalid Option"
                    break;;
            esac
        done
}

PS3="select your option: "

while true 
do 
    echo -e "\n Hello To Admin Menu"
    select x in "User" "Group" "Exit"
    do
        case $x in 
            "User")
                user
                break
                ;;

            "Group")
                group
                break
                ;;
            "Exit")
                echo "Exiting program..."
                exit 0
                ;;
            *)
                echo "Invalid option, please try again"
                break
                ;;
        esac
    done    
done
