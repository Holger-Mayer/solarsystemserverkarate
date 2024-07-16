package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerformanceTest extends Simulation {

  val protocol = karateProtocol( )

  // protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  val createDelete = scenario("CGD").exec(karateFeature("classpath:solarsystemserver/performance/PerformanceTest.feature"))
 

  setUp(
    createDelete.inject(rampUsers(1) during (5 seconds),
                        rampUsers(10) during (15 seconds),
                        rampUsers(30) during (25 seconds)
                       ).protocols(protocol)
   
  )

}