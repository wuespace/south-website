<div class="title">
  <h1>S²OUTH</h1>
  
  <p>
  <b>S</b>tudent’s <b>S</b>ub-<b>O</b>rbital
  <b>U</b>nified <b>T</b>elemetry <b>H</b>andler
  </p>
</div>

<div class="contents">
  <h2>Abstract</h2>
  
  <p>
    <i>S²OUTH</i> is a project developing a modern and reliable telemetry system.
    The goal of the system is to provide live telemetry including sensor data,
    and high precision pose estimation for the entire duration of a suborbital spaceshot flight.
    Furthermore the project includes a secondary high bandwidth RF link to stream high fidelity video of the rocket during the flight.
  </p>
  
  <p>The project was originally conceived in collaboration with the student team from
    <i>HyEnD Stuttgart</i> for usage in their <i>N₂ORTH</i> hybrid propellant rocket.
    Since then a preliminary version of the project named 
    <a href="/south-cube">South Cube</a> has flown as payload on the <i>Ispida</i> rocket build by
    <i>Aerospace Team Graz (ASTG)</i> and further options for collaborations with student teams are being explored.
  </p>
  
  <p>
    The <i>N₂ORTH</i> rocket is currently scheduled to fly in early to mid 2027.
    More details can be found on the <a href="/north">N₂ORTH</a> page.
  </p>
  
  <h2>Capabilities</h2>
  
  <p>
    The <i>S²OUTH</i> project is designed to provide the following capabilities:
  </p>
  
  <h3>
    Distributed system
  </h3>
  
  <p>
    The onboard system is made up of nine distinct boards connected via a two redundant
    CAN busses to ensure that no single component failure causes the entire system to fail.
  </p>
  
  <h3>Sensor board</h3>
  
  <p>
    The system contains two redundant sensor boards each containing two IMUs,
    a magnetometer, a barometer and a connection to one of two <i>DLR Phoenix</i> GPS receivers.
    Each sensor board also contains a MCU for pose estimation.
  </p>
  
  <h3>Telemetry downlink</h3>
  
  <p>
    Built on top of the OpenLST project, our 437Mhz based telemetry downlink
    guarantees a stable connection throughout the entire flight.
  </p>
  
  <figure class="wp-block-image size-large"><img decoding="async" width="2560" height="2560" src="https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-scaled.jpg" alt="" class="wp-image-125" srcset="https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-scaled.jpg 2560w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-300x300.jpg 300w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-1024x1024.jpg 1024w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-150x150.jpg 150w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-768x768.jpg 768w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-1536x1536.jpg 1536w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/RocketLST-edited-2048x2048.jpg 2048w" sizes="(max-width: 2560px) 100vw, 2560px"></figure>
  
  <h3>Power supply</h3>
  
  <p>
    The power supply connects to two 4s2p LiIon batteries (main and backup) and
    distributes the power to all different systems using isolated power rails.
    The power supply board constantly monitors current, voltage, and temperature
    of the two batteries and is able to quickly switch to the backup if
    measurements exceed specifications.
  </p>
  
  <figure class="wp-block-image size-large"><img decoding="async" width="2560" height="2560" src="https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-scaled.jpg" alt="" class="wp-image-124" srcset="https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-scaled.jpg 2560w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-300x300.jpg 300w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-1024x1024.jpg 1024w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-150x150.jpg 150w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-768x768.jpg 768w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-1536x1536.jpg 1536w, https://south.wuespace.de/wp-content/uploads/sites/5/2025/10/EPS-edited-2048x2048.jpg 2048w" sizes="(max-width: 2560px) 100vw, 2560px"></figure>
  
  <h3>RocketHD</h3>
  
  <p>
    Build on top of the <i>OpenIPC</i> and <i>wifibroadcast</i> project,
    <i>RocketHD</i> aims to provide a high bandwith link for video and backup
    telemetry transmission. Using our custom <i>WifiBroadcast</i> software as well
    as four amplifiers and patch antennas we hope to receive high definition video
    live from space.
  </p>
  
  <h3>Groundstation</h3>
  
  <p>
    To enable continuous receiving of data a custom build antenna tracker is used.
    As part of the <i>RocketHD</i> project we aim to point a 5.8GHz dish antenna
    with 0.5 degrees of precision.
  </p>
</div>

<style>
  .title {
    width: 50%;
    height: 100%;
    margin: auto;
    text-align: center;
    justify-content: center;
  }

  .contents {
    width: 50%;
    height: 100%;
    margin: auto;
    justify-content: center;
  }
</style>
