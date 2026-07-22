---
title: "Bangalore JUG Meetup @ Oracle Hub"
date: 2026-07-18
draft: false
featureimage: "images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_1.png"
description: "Event Summary and My Learning from the Bangalore JUG meetup at Oracle Hub, focusing on JEP 528: Post-Mortem JVM Crash Analysis with jcmd, and JDK 25+ developments like Post-Quantum Cryptography."
tags: ["community", "java", "openjdk", "jcmd", "post-quantum-cryptography", "blrjug", "oracle-hub"]
aliases: ["/talks/bangalore-jug-meetup-oracle-2026/"]
communityRoles: ["attendee"]
---

![Bangalore Java User Group Meetup @ Oracle Hub](images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_1.png)

# Event Summary

The Bangalore Java User Group (Bangalore JUG) meetup hosted at the Oracle Tech Hub on July 18, 2026, brought together the local developer community for an exceptional day of deep-dive technical sessions focusing on JVM serviceability, advanced HotSpot diagnostics, and the future evolution of the Java platform.

The event featured two highly detailed sessions by industry experts:

1. **Talk #1: Post-Mortem JVM Crash Analysis with jcmd**
   - **Speaker:** Fairoz Matte (Java Platform Sustaining Engineer @ Oracle)
   - **Details:** This session introduced **JEP 528: Post-Mortem Crash Analysis with jcmd**, a groundbreaking OpenJDK initiative. Fairoz explored how developers can use the familiar `jcmd` utility—typically reserved for live, running JVMs—to inspect crashed JVM core files. The session highlighted the ingenious **"process revival"** technique, which safely enables the JVM to inspect its own crash dumps to execute commands like `Thread.print`, `GC.heap_dump`, `GC.class_histogram`, and `VM.metaspace` without having to revive the active application itself. Fairoz also provided deep insights into HotSpot internals, core dump analysis, and how this unifies live and post-mortem troubleshooting.

![Post-Mortem JVM Crash Analysis Session by Fairoz Matte](images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_2.png)

2. **Talk #2: JDK25+ : PQC, COH, Auto-Tunable ZGC, and the Future of Java**
   - **Speaker:** Vaibhav Choudhary (JVM Engineer @ Salesforce & Bangalore JUG Leader)
   - **Details:** Vaibhav's session looked forward to the future of the Java platform from JDK 25 through JDK 27. The talk focused on production-ready innovations like **Post-Quantum Cryptography (PQC)** to prepare systems for future security challenges, **Compact Object Headers (COH)** for memory footprint optimization, and **Auto-Tunable ZGC** to automatically balance garbage collection performance. Additionally, the talk examined how the memory efficiency and performance gains of JDK 25+ can significantly reduce Cloud Total Cost of Ownership (TCO).

![JDK25+ & Future of Java Session by Vaibhav Choudhary](images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_3.jpeg)

# My Contribution / Learnings

Attending this Bangalore JUG meetup was an incredibly rewarding experience that expanded my knowledge of both lower-level HotSpot diagnostics and upcoming security and performance enhancements in Java. 

My key learnings and takeaways from the sessions include:
* **Simplified Post-Mortem Debugging:** I learned about the implementation details of JEP 528. Understanding how a crashed JVM can revive itself just enough to respond to standard diagnostic commands (`Thread.print`, `GC.class_histogram`, etc.) via `jcmd` makes core dump analysis much more accessible. This eliminates the need to fiddle with complex native debuggers like `gdb` or learn entirely separate toolsets.
* **Preparing for the Quantum Era:** The session on Post-Quantum Cryptography (PQC) highlighted how the Java platform is proactively integrating quantum-resistant algorithms to secure data before quantum computing becomes a widespread threat to traditional encryption.

![JVM Engineering and Diagnostic Discussions](images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_4.jpeg)

* **Optimizing Cloud Cost:** The introduction of Compact Object Headers (COH) and Auto-Tunable ZGC demonstrated how the JVM is continuously optimized for cloud native environments. Reducing object header size translates directly to lower heap usage and higher throughput, which yields a significant reduction in Cloud TCO (Total Cost of Ownership).
* **Community Connection:** Beyond the technical sessions, I had a fantastic time networking with other Java developers, JUG organizers, and JVM engineers. Discussing real-world production challenges and sharing experiences on JVM performance tuning was a highlight of the day.

![Bangalore JUG Community Group & Networking](images/blrjug_meetup_july_2026/blrjug_meetup_july_2026_5.jpeg)

---

# Relevant Links

- **Bangalore JUG:** [Meetup Page](https://www.meetup.com/bangalore-jug/)
- **LinkedIn:** [Post Link](https://www.linkedin.com/in/hari-nikesh-r-930bb723a/)
