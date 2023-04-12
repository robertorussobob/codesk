Write-Host "1. Oracle VirtualBox must be installed: https://download.virtualbox.org/virtualbox/6.1.26/VirtualBox-6.1.26-145957-Win.exe" -ForegroundColor yellow
Write-Host "2. Vagrant must be installed: https://releases.hashicorp.com/vagrant/2.3.4/vagrant_2.3.4_windows_i686.msi" -ForegroundColor yellow
Write-Host "3. Hyper-V must be disabled: save all your work, close all your apps; [Windows]+X A; bcdedit /set hypervisorlaunchtype off; shutdown /r /t 0" -ForegroundColor yellow

$StopWatch = [system.diagnostics.stopwatch]::startNew()

Write-Host "Copy here your ~\.aws" -ForegroundColor blue
Copy-Item -Path "~\.aws" -Destination "." -recurse -Force -Verbose
Rename-Item -Path .aws -newName aws

Write-Host "Copy here your ~\.gitconfig" -ForegroundColor blue
Copy-Item -Path "~\.gitconfig" -Destination "." -recurse -Force -Verbose

Write-Host "Copy here your ~\.git-credentials" -ForegroundColor blue
Copy-Item -Path "~\.git-credentials" -Destination "." -recurse -Force -Verbose

Write-Host "Install plugin: vagrant-cachier" -ForegroundColor blue
vagrant plugin install vagrant-cachier

Write-Host "Destroy VM" -ForegroundColor blue
vagrant destroy -f

Write-Host "Boot VM" -ForegroundColor blue
vagrant up

Write-Host "Clone repos" -ForegroundColor blue
vagrant ssh -c "/vagrant/setup.sh"

Write-Host "Status" -ForegroundColor blue
vagrant ssh -c "/vagrant/status.sh"

#Write-Host "Type 'vagrant ssh' to login inside the VM" -ForegroundColor blue
#Write-Host "Type 'than type 'gcloud init' to configure gcloud CLI" -ForegroundColor blue

Write-Host "Elapsed: $($StopWatch.Elapsed.TotalSeconds) s" -ForegroundColor blue

