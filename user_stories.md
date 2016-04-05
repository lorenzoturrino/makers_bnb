*Host can add list

  ** Create Table (Listings)
    ** ID, Name (All require)
  ** Add a row
  ** Show a form to enter a listing
  ** Return the row via front end


* Host can Sign Up

  ** Create Table (Hosts)
    ** Name, Usernname, E-Mail (Verification), Password (Verification) --> All Reuqire!
  ** FrontEnd
    * Create Form
  **Bonus
    Login/LogOut

* Connect listings to users
  ** Connect Tables one to many
   ** Host has many listings /Listings have one one User
  ** Host can see all their spaces on homescreen


* Add properties to listing
  ** Name, Description, Price (All require)
  ** Edit create space form so that one can enter this information
  ** Make sure the information is reflected in the listings Feed and hosts dashboard

* Add date property to listing
    ** One day bookings only! 
    ** Available Date
    ** Booked Dates  

* Users can sign up
    ** Name, Usernname, E-Mail (Verification), Password (Verification) --> All Reuqire!
  ** FrontEnd
    ** Create Form
  ** Bonus
    ** Login/LogOut

* Users can see avialable spaces and dates
    ** only display spaces available
    ** only display dates that are available
    

* User can request a space
    ** Host gets request on dashboard
    ** Host can confirm / reject
    ** User gets notification of hosts decision on user dashboard


* Space is available until a booking confirmed
    ** avialble dates only change if booking confirmed 
      ** Publisher Confirm
      ** User confirm (money received)

### Optional

* Reset Password

* Extra properties of Listings
  *Tags
  ** Pictures

* Add a date range for bookinng

* A host can see their spaces


### Bugs
* Sessions do not persist a server restart