# This is intended to be sourced into other scripts, etc.
TORQUEBOX_HOME="/opt/puppetlabs/server/apps/razor-server/share/torquebox"
JBOSS_HOME="${TORQUEBOX_HOME}/jboss"
JRUBY_HOME="${TORQUEBOX_HOME}/jruby"
PATH="${JRUBY_HOME}/bin:${PATH}"
export PATH TORQUEBOX_HOME JBOSS_HOME JRUBY_HOME
