package com.uucyan.girlsbandpartyprofileapi.repository

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.support.SimpleJpaRepository
import org.springframework.stereotype.Repository
import com.uucyan.girlsbandpartyprofileapi.entity.BangDreamer

@Repository
interface BangDreamerRepository: JpaRepository<BangDreamer, Long> {
    fun getById(id: Long): BangDreamer?
}
