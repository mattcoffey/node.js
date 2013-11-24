node default {
    include environment
    include nodejs 

    Class["environment"] ->
    Class["nodejs"]

}
