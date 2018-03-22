package com.uucyan.girlsbandpartyprofileapi.service.impl

import org.springframework.stereotype.Service
import com.uucyan.girlsbandpartyprofileapi.entity.BangDreamer
import com.uucyan.girlsbandpartyprofileapi.service.BangDreamerService
import com.uucyan.girlsbandpartyprofileapi.repository.BangDreamerRepository

@Service
class BangDreamerServiceImpl(private val bangDreamerRepository: BangDreamerRepository): BangDreamerService {

    override fun findAllBangDreamer(): MutableList<BangDreamer> = bangDreamerRepository.findAll()

    override fun findById(id: Long): BangDreamer? = bangDreamerRepository.getById(id)

    override fun save(bangDreamer: BangDreamer) {
        bangDreamerRepository.save(bangDreamer)
    }

    override fun delete(bangDreamer: BangDreamer) {
        bangDreamerRepository.delete(bangDreamer)
    }
}
