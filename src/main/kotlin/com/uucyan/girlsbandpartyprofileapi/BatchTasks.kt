package com.uucyan.girlsbandpartyprofileapi

import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component
import org.springframework.core.env.Environment
import org.springframework.web.client.RestTemplate
import org.springframework.web.client.HttpClientErrorException
import org.springframework.http.HttpMethod
import me.mattak.moment.Moment

@Component
class BatchTasks(private val environment: Environment) {

    companion object {
        private const val DEV_ENV = "dev"
        private const val HEROKU_APP_URL = ""
    }

    /* @Scheduled(initialDelay = 1200000, fixedDelay = 1200000)
    fun connectionHerokuApp() {
        if (environment.getProperty("spring.config.name") == DEV_ENV) return

        val restTemplate = RestTemplate()
        try {
            restTemplate.exchange(HEROKU_APP_URL, HttpMethod.GET, null, String::class.java)
        } catch (e: HttpClientErrorException) {
            println("定期アクセス ステータスコード:${e.getStatusCode()}")
        }
    } */
}
