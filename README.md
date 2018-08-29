# k8s-jnlp-agent
A barebones JNLP agent for use with the Kubernetes (agent) plugin.

No `agent.jar` (`slave.jar`) is installed as it depends on the jar being downloaded from the Jenkins Master requesting the agent using `wget`.


