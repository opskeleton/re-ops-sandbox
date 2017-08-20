node default {

  include apt

  package{'sysstat':
    ensure  => present
  }

  package{'stress':
    ensure  => present
  }

  package{'openjdk-8-jre-headless':
    ensure  => present
  }

  class{'barbecue':} ->

  package{['libzmq1', 'libzmq-jni', 'libsodium']:
    ensure  => present,
    require => Class['apt::update']
  }

  ssh_authorized_key { 'ronen@ch':
    user => 'vagrant',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDV9UngiTAaDG0o0UOLjtpougTXxqV4crxKS203wqyJYMZlZ4YWzlEekLcSPEa1GJf0LO6Bf1N0t63mrTJmH0SFyEmhJYCmL4W3/bzrXDT8kAMGZ5dGe4w7vjOLhJo6iqzWfoIWvAbe9dcQH+cmc5IWwZVW1ek82rsEARoLQh5a0fKAsBEMODkB4vcj37LBpMu1aft9NqrNwOhDczGBHQgojzIbscy2OcLP+UCYx8oPLTmQ9hkJXk73HA9fRR/8I4F9eFGE0TSjkEj1RdN1bCnosPIhzN3bGJ+IdzD2Eqi3gPa67RPZr43rGkcHcNc0o0Zh5jcXOnWeTwK+mQbUJGnl',
  }

  ssh_authorized_key { 'ronen@enc':
    user => 'vagrant',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDUeM8xZ5mm8EINxLxVngs6WNEH1jNzBSVe53wXtErXV3bRm0G+j2F/F3Cr1VXZdmli96Xgl2P9hViczZIO6EHXCdXoOI0HrMcdXIHMuGRNw2o6xkNp61/UsLcFpmmXrDp1IyKw90kMeUPxJiS4w1Y6P16BnBMSGYr4x5zsMGg+HDGEleaMfKRuaUhSLFc9LhkNBIx4RTIjsJTjohi6MvgkeOHYKiyMq4xeFgI4bdJcduOymdkJBICc1Byy/JCRCJxc2V6HT6JIQ57+u+0+9sss1+iHby69XaHaOWAeXjwV45dpxhhkJ6SIhH/JKa25kAQ7M2Mh04LKnzZWsvXBIqAJ'
  }

  ssh_authorized_key { 'ronen@ros':
    user => 'vagrant',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHN75TlTbKYsl23Y+ek8H8NIfPL+0Ooa25+UETuG7IdB1jmuBwuNg/D0HPI1IZzXdj/aZ169qn4s0Dor9M/mpIRaA8+K0c1aEfSItF073bW0W3vp2bqBG9ELA+0DTiISJR9aaERpqZbViiHJLwsD+7SrxagJl9pkZz8/E+tc2vFvdEP6bkqwaSj5Jr6vIo04IjpRB3NT5QkeiF4P1yi/+OQ4+q66gdYsAjTUgO5Bv/BQuu8XsjHeNj/j0dnyvd+b/amxhKalAemnVR9LqDOIRqDtgXRzZ2A1Kfru4xiYnnoQptRvNZIOAgBKSrcoFclwu1rfntb2bROGGsWngBQEY3'
  }

}
