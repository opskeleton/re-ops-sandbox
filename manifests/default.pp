node default {

  if $hostname == 'supa' {
    include boxes
    File['/var/boxes'] ->

    file{'/var/boxes/1':
      ensure  => present,
      content => 'this is alive'
    }
  }

  ssh_authorized_key { 'ronen@lepus':
    user => 'vagrant',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDmp4knkVGw92Ok6kN95NxjjcRBbHttWX8NbA1a00hkYN1eva5uKJb0CqRukb3a/m2AuKPTn5ShDGHRwyd9TrBqgPc0ee5rFaNF3rGKsth3t/CrvnSU0dpMGUzAYy+HEeutEdPCaDDyZtP6rImtCq6KfOh8NZ4hqRwTvyraNI8fYhC/ZyGdT6sMxedEV9azar3gKahPWzuuIDmQS5ZCS2sHWrbAQODhTnuzHuQR+Toafwba1u1YtNGIi/Ro/xraVXlvOCOI75DhhMrxGE6/ruBHgorgCHwwJl+JZOInpQvtWXM+vV7GUYW2AiVIcJg+XCt12YN3Zkyk0F6G3DPujU51',
  }
}
