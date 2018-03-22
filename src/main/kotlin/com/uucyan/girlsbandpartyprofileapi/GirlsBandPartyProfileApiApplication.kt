package com.uucyan.girlsbandpartyprofileapi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableScheduling

@SpringBootApplication
@EnableScheduling
class GirlsBandPartyProfileApiApplication

fun main(args: Array<String>) {
    runApplication<GirlsBandPartyProfileApiApplication>(*args)
}
