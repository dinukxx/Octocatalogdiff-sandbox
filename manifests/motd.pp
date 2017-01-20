
class fileStore(
){
$configurationPath = hiera('file_path')
alert("path is set to: ${configurationPath}")
$currentUser=hiera('user')

if $facts['os']['family']=='Darwin'
{
	file {$configurationPath:
	ensure =>file,
	content =>"this is a ${operatingsystem} box with the hostname set to : ${hostname}",
	}
}
else
{	
	
	file{$configurationPath:
	ensure=>file,
	content => " information : ${currentUser} and path is set to : ${configurationPath}  ",
	}
}

if $facts['os']['family']=='RedHat'
{
	$result2 = range(6,10).each |$num| 
	{
  	$filename = "/tmp/test${num}.txt"
  	file{$filename: 
	ensure => present,
	content => "this is the ${num}file.",
	}
}

}

}
