
import core4inet.nodes.ethernet.AS6802.TTEEtherHost;
import core4inet.incoming.AS6802.TTIncoming;
import core4inet.buffer.AS6802.TTDoubleBuffer;
import core4inet.incoming.AS6802.RCIncoming;
import core4inet.buffer.AS6802.RCQueueBuffer;

module icp extends TTEEtherHost
{
    @display("bgb=503,314");
    submodules:
        vl_100_ctc: TTIncoming {
            parameters:
                @display("p=350,60");

        }
        vl_100: TTDoubleBuffer {
            parameters:
                @display("p=450,60");
        }
        vl_101_ctc: RCIncoming {
            parameters:
                @display("p=350,160");

        }
        vl_101: RCQueueBuffer {
            parameters:
                @display("p=450,160");
        }
    connections:
        vl_100_ctc.out --> vl_100.in;
        vl_101_ctc.out --> vl_101.in;
}