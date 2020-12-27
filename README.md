## Purpose 🛡
The Attack Range is a detection development platform, which solves three main challenges in detection engineering. First, the user is able to build quickly a small lab infrastructure as close as possible to a production environment. Second, the Attack Range performs attack simulation using different engines such as Atomic Red Team or Caldera in order to generate real attack data. Third, it integrates seamlessly into any Continuous Integration / Continuous Delivery (CI/CD) pipeline to automate the detection rule testing process.  

## Building 👷‍♂️

Attack Range can be built in three different ways:

- **cloud** using terraform and AWS or Azure.
- **locally** with vagrant and virtualbox see the [attack\_range\_local](https://github.com/splunk/attack_range_local/) project for details
- **serverless** see the [attack\_range\_cloud](https://github.com/splunk/attack_range_cloud/) project for details

## Installation 🏗

### [AWS and Ubuntu 18.04](https://github.com/splunk/attack_range/wiki/AWS:-Ubuntu-18.04-Installation)

### [AWS and MacOS](https://github.com/splunk/attack_range/wiki/AWS:-MacOS-Installation)

### [Azure and MacOS](https://github.com/splunk/attack_range/wiki/Azure:-MacOS-Installation)


## Architecture 🏯
![Logical Diagram](docs/attack_range_architecture.png)

The virtualized deployment of Attack Range consists of:

- Windows Domain Controller
- Windows Server
- Windows Workstation
- A Kali Machine
- Splunk Server
- Phantom Server
- Zeek Sensor

#Installation Steps On Ubuntu/Linux machines

- Python3 

#### Logging
The following log sources are collected from the machines:

- Windows Event Logs (```index = win```)
- Sysmon Logs (```index = win```)
- Powershell Logs (```index = win```)
- Network Logs with Splunk Stream (```index = main```)
- Attack Simulation Logs from Atomic Red Team and Caldera (```index = attack```)

## Running 🏃‍♀️
Attack Range supports different actions:

- Configuring Attack Range
- Build Attack Range
- Perform Attack Simulation
- Test with Attack Range
- Destroy Attack Range
- Stop Attack Range
- Resume Attack Range
- Dump Log Data from Attack Range


### Build Attack Range
- Build Attack Range
```
python attack_range.py build
```

### Show Attack Range Infrastructure
- Show Attack Range Infrastructure
```
python attack_range.py show
```

### Perform Attack Simulation
- Perform Attack Simulation
```
python attack_range.py simulate -st T1003.001 -t ar-win-dc-default-Attack-Range-Key
```

### Test with Attack Range
- Automated testing of detection:
```
python attack_range.py test -tf tests/T1003_001.yml
```

### Destroy Attack Range
- Destroy Attack Range
```
python attack_range.py destroy
```

### Stop Attack Range
- Stop Attack Range
```
python attack_range.py stop
```

### Resume Attack Range
- Resume Attack Range
```
python attack_range.py resume
```

### Dump Log Data from Attack Range
- Dump Log Data from Attack Range
```
python attack_range.py dump -dn data_dump
```


### Replay Dumps into Attack Range Splunk Server
- Replay previously saved dumps from Attack Range
```
python attack_range.py replay -dn data_dump [--dump NAME_OF_DUMP]
```
- default will dump all enabled dumps described in `attack_data/dumps.yml`
- with optional argument `--dump` you can specify which dump to replay
```
python attack_range.py replay -dn data_dump --dump windows_sec_events
```

## Features 💍
- [Splunk Server](https://github.com/splunk/attack_range/wiki/Splunk-Server)
  * Indexing of Microsoft Event Logs, PowerShell Logs, Sysmon Logs, DNS Logs, ...
  * Preconfigured with multiple TAs for field extractions
  * Out of the box Splunk detections with Enterprise Security Content Update ([ESCU](https://splunkbase.splunk.com/app/3449/)) App
  * Preinstalled Machine Learning Toolkit ([MLTK](https://splunkbase.splunk.com/app/2890/))
  * Splunk UI available through port 8000 with user admin
  * ssh connection over configured ssh key

- [Splunk Enterprise Security](https://splunkbase.splunk.com/app/263/)
  * [Splunk Enterprise Security](https://splunkbase.splunk.com/app/263/) is a premium security solution requiring a paid license.
  * Enable or disable [Splunk Enterprise Security](https://splunkbase.splunk.com/app/263/) in [attack_range.conf](https://github.com/splunk/attack_range/blob/develop/attack_range.conf.template)
  * Purchase a license, download it and store it in the apps folder to use it.

- [Splunk Phantom](https://www.splunk.com/en_us/software/splunk-security-orchestration-and-automation.html)
  * [Splunk Phantom](https://www.splunk.com/en_us/software/splunk-security-orchestration-and-automation.html) is a Security Orchestration and Automation platform
  * For a free development license (100 actions per day) register [here](https://my.phantom.us/login/?next=/)
  * Enable or disable [Splunk Phantom](https://www.splunk.com/en_us/software/splunk-security-orchestration-and-automation.html) in [attack_range.conf](https://github.com/splunk/attack_range/blob/develop/attack_range.conf.template)

- [Windows Domain Controller & Window Server & Windows 10 Client](https://github.com/splunk/attack_range/wiki/Windows-Infrastructure)
  * Can be enabled, disabled and configured over [attack_range.conf](https://github.com/splunk/attack_range/blob/develop/attack_range.conf.template)
  * Collecting of Microsoft Event Logs, PowerShell Logs, Sysmon Logs, DNS Logs, ...
  * Sysmon log collection with customizable Sysmon configuration
  * RDP connection over port 3389 with user Administrator

- [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team)
  * Attack Simulation with [Atomic Red Team](https://github.com/redcanaryco/atomic-red-team)
  * Will be automatically installed on target during first execution of simulate
  * Atomic Red Team already uses the new Mitre sub-techniques

- [Caldera](https://github.com/mitre/caldera)
  * Adversary Emulation with [Caldera](https://github.com/mitre/caldera)
  * Installed on the Splunk Server and available over port 8888 with user admin
  * Preinstalled Caldera agents on windows machines

- [Kali Linux](https://www.kali.org/)
  * Preconfigured Kali Linux machine for penetration testing
  * ssh connection over configured ssh key

