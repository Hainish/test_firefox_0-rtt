# How to test

Run

    docker build -t test_firefox_0-rtt .
    docker run -ti --rm \
        --name test_firefox_0-rtt \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $(pwd)/packet_dump:/opt/packet_dump \
        test_firefox_0-rtt

Then run firefox by typing `firefox/firefox`

In another terminal, run

    docker exec -it test_firefox_0-rtt tcpdump -s 0 -w packet_dump/dump.pcap
