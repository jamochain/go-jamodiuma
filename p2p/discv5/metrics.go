package discv5

import "github.com/jamochain/go-jamodiuma/metrics"

var (
	ingressTrafficMeter = metrics.NewRegisteredMeter("discv5/InboundTraffic", nil)
	egressTrafficMeter  = metrics.NewRegisteredMeter("discv5/OutboundTraffic", nil)
)
