#
# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
#

#typeset +x PS1="\h:\\$ "
#xset b off
#PATH=/usr/bin:/usr/sbin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb
#Alias
#ln -s /net/mf-cblr03-02.in.oracle.com/usr/dist /usr/


export http_proxy="www-proxy.us.oracle.com"
export https_proxy="www-proxy.us.oracle.com"

function ssh_kfix() {
	a=(`echo $1 | tr ':' ' '`);
	echo "Removing line ${a[1]} from ${a[0]}"
	echo "${a[1]}\nd\nw\nq\n" | ed ${a[0]}
}

function vmstop
{
   ssh -l pvakayil $1 -t "(vm status | grep -w active | cut -d ' ' -f 1| xargs -i vm stop {} ) "
}

function vmstatus
{
   ssh -l pvakayil $1 -t "(vm status )"
}

function title 
{
	case $TERM in
		xterm*)
		local ORIG=$PS1
		;;
	*)
		local TITLEBAR=''
		;;
	esac
ORIG=$PS1
TITLE="\e]2;$1\a"
PS1=${ORIG}${TITLE}
PS2='> '
PS4='+ '
}
xhost + >& /dev/null
alias cl=clear
alias Q=exit
alias E="/usr/bin/evince"
alias xl=xlock
alias l='ls -lrt'
#alias ll='ls -lrt --color'
#alias ls='ls --color'
#alias vi="/export/home/cm230084/.local/bin/vim73b"
alias vi="/usr/local/bin/vim"
alias BugProcess='/usr/bin/vim /home/pri/Desktop/BugProcess'
alias TBD='/usr/bin/vim /home/pri/Desktop/TBD'
alias u='uname -a'
alias x='xterm &'
alias sl='screen -ls'
alias cs='/ws/on10-patch-tools/onbld/bin/i386/cscope-fast -d .'
alias C='/ws/onnv-tools/onbld/bin/i386/cscope-fast -d .'
alias 10='cd /ws/on10-patch/usr/src/'
alias 11='cd /ws/onnv-clone/usr/src/'
alias 10u='cd /ws/on10-patch/usr/src/uts;/ws/on10-patch-tools/onbld/bin/i386/cscope-fast -d .'
alias 11u='cd /ws/on11u1-clone/usr/src'
alias 10some='cd /ws/onnv-clone/usr/src/uts;/ws/on10-patch-tools/onbld/bin/i386/cscope-fast -d .'
alias es='cd ~/my_escs/'
alias sc='cd /net/ssaesrv.us.oracle.com/export/users/cm230084/'
alias esc='cd /backup/chand_colleactions/sun_learning/my_escalations/'
alias csc='cd /ws/on10-patch/usr/src/'
alias L='cd /ROOT_POOL/Learn/'
alias me='cd /export/home/cm230084/my_test_pgms'
alias FF='/export/home/cm230084/.mozilla/firefox/firefox-bin'
alias cscopepath='/ws/onnv-tools/onbld/bin/i386/cscope-fast'
alias vi='/usr/bin/vim'
alias training='cd /home/admin/Priyesh/training'
alias bugs='cd /home/pri/Bugs'
alias sshr='ssh -l root'
alias sshp='ssh -l pvakayil'
alias ssh10s='ssh -l pvakayil scapen-cs10-0.us.oracle.com -t bash'  
alias ssh10x='ssh -l pvakayil scapen-csx10-0.us.oracle.com -t bash'     
alias ssh11.1s='ssh -l pvakayil scapen-cs11u1-1.us.oracle.com -t bash'  
alias ssh11.1x='ssh -l pvakayil scapen-csx11u1-1.us.oracle.com -t bash'     
alias ssh11.2s='ssh -l pvakayil scapen-cs11u2-0.us.oracle.com -t bash'  
alias ssh12s='ssh -l pvakayil scapen-cs12-0.us.oracle.com -t bash'  
alias ssh12x='ssh -l pvakayil scapen-csx12-0.us.oracle.com -t bash'     
alias sshon10p='ssh -l pvakayil on10-public.us.oracle.com -t bash'
alias sshon10px='ssh -l pvakayil on10-public-x.us.oracle.com -t bash'
alias sshju='ssh -l pvakayil jurassic.sfbay -t bash'
alias sshtri='ssh -l pvakayil trigati.us.oracle.com -t bash' #x86
alias sshstem='ssh -l pvakayil onnv-pubs-steam.us.oracle.com -t bash' #sparc
alias sshtrain='ssh -l pvakayil onnv-pubs-train.us.oracle.com -t bash' #sparc
alias sshv='ssh -Xl pvakayil virtual.in.oracle.com -t bash'
alias sshvcz='ssh -Xl pvakayil virtual.cz.oracle.com -t bash'
alias sshvscz='ssh -Xl pvakayil virtuals.cz.oracle.com -t bash'
alias sshv2='ssh -Xl pvakayil virtual2.in.oracle.com -t bash'
alias sshvs='ssh -Xl pvakayil virtuals.in.oracle.com -t bash'
alias sshdr='ssh -l pvakayil drosera.us.oracle.com -t bash'
alias sshdri='ssh -l pvakayil drosera.in.oracle.com -t bash'
alias sshx86bld='ssh -l pvakayil onnv-x86-build.in.oracle.com -t bash'
alias sshcores10xa='ssh -l pvakayil c3xs10a.us.oracle.com -t bash'
alias sshcores10xb='ssh -l pvakayil c3xs10b.us.oracle.com -t bash'
alias sshcores10sa='ssh -l pvakayil c3ss10a.us.oracle.com -t bash'
alias sshcores10sb='ssh -l pvakayil c3ss10b.us.oracle.com -t bash'
alias sshcores10sc='ssh -l pvakayil c3ss10c.us.oracle.com -t bash'
alias sshcores11xa='ssh -l pvakayil c3xs11a.us.oracle.com -t bash'
alias sshcores11xb='ssh -l pvakayil c3xs11b.us.oracle.com -t bash'
alias sshcores11sa='ssh -l pvakayil c3ss11a.us.oracle.com -t bash'
alias sshcores11sb='ssh -l pvakayil c3ss11b.us.oracle.com -t bash'
alias sshcores11sc='ssh -l pvakayil c3ss11c.us.oracle.com -t bash'
alias myscreens='ssh -l pvakayil rhone.us.oracle.com -t screen -ls'
alias screenopen='ssh -l pvakayil rhone.us.oracle.com -t screen -x'
alias screencreate='ssh -l pvakayil rhone.us.oracle.com -t screen -S'
alias ll='ls -l'
alias cc='gcc'

alias S='ssh -l pvakayil'

setxkbmap -option ctrl:swapcaps

#umask           
#umask 022

#export PATH=$PATH:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb:/net/drosera/export/proj/inet/kini/SUNWscat/bin
#add this to path whenever required : /net/mage.central/opt/SUNWscat/bin:/net/drosera/export/proj/inet/kini/SUNWscat/bin 
#                                     :/ws/on10-tools/teamware/bin:/ws/on10-tools/onbld/bin:/ws/on10-patch-tools/teamware/bin:/ws/on10-patch-tools/onbld/bin
#export PATH=/usr/bin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb:/net/mage.central/opt/SUNWscat/bin:/net/drosera/export/proj/inet/kini/SUNWscat/bin:/ws/on10-tools/teamware/bin:/ws/on10-tools/onbld/bin:/ws/on10-patch-tools/teamware/bin:/ws/on10-patch-tools/onbld/bin

export PYTHONPATH=/opt/csw/bin/python3.3
export
PATH=:/opt/hping3:/usr/local/lib/:/opt/SUNWscat/bin:/usr/bin:/usr/sbin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb:/usr/lib:/cores_data/local/bin:/usr/dist/exe:/software/dropbox/

#export PATH=/usr/bin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb
export EDITOR=/usr/bin/vim
export TERM=xterm

#only for build
#unset PROFILE
#export PATH=/ws/onnv-tools/onbld/bin:/opt/onbld/bin:/usr/sbin:/ws/on10-tools/teamware/bin:/ws/on10-tools/onbld/bin:/usr/bin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb
#only for onnv build
#export PATH=/opt/onbld/bin:/usr/sbin:/ws/on10-tools/teamware/bin:/ws/on10-tools/onbld/bin:/usr/bin:/usr/openwin/bin:/usr/ucb:/opt/csw/bin:/usr/sfw/bin:/usr/ccs/bin:/opt/SUNWspro/bin:/opt/csw/bin:/usr/X11/bin:/usr/local/bin:/usr/dt/bin:/usr/openwin/bin:/usr/ucb
