//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

import inet.node.ethernet.Eth100M;

//
// Small sample network with two hosts and one switch that shows how to 
// build application models for the simulation. The example uses two different
// applications (TicApp and TocApp) that pass messages to each other
// - Uses 5ms Cycletime
// - 80ns Tick length

network TTEtherSim
{
    @display("bgb=,,white");
    submodules:
        //Device hosting the Tic application
        ICP: icp {
            @display("p=39,70");
        }
		//Device hosting the Toc application
        client1: client {
            @display("p=247,70");
        }
		//Switch that forwards Tic and Toc messages
        switch: ttswitch {
            parameters:
                @display("p=147,70");
            gates:
                ethg[2];
        }
    connections:
        //
        // The example uses a simple star topology
        //
        ICP.ethg <--> Eth100M {  length = 10m; } <--> switch.ethg[0];
        client1.ethg <--> Eth100M {  length = 20m; } <--> switch.ethg[1];
}