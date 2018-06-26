The following scripts are used for admin functions of the local Merritt Cloudhost.

This server provides a local test platform on uc3-mrtreplic1-dev (mrt-cloudhost-dev).

Scripts:
buildcsh.sh - build cloudhost environment
    - calls installcsh.sh to download jsr from builds.cdlib.org

startcsh.sh - start cloudhost with ports:
30449 - https with unsigned certificate
38080 - http
    - calls runcsh.sh to start processing

stopcsh.sh - stop cloudhost

statecsh.sh - do  state request on Merritt Cloudhost:
    OK -running
    FAIL: <optional error>

killcsh.sh - kill running cloudhost if found

