package com.uucyan.girlsbandpartyprofileapi.service

import com.uucyan.girlsbandpartyprofileapi.entity.BangDreamer

interface BangDreamerService {
    abstract fun findAllBangDreamer(): MutableList<BangDreamer>
    abstract fun findById(id: Long): BangDreamer?
    abstract fun save(bangDreamer: BangDreamer)
    abstract fun delete(bangDreamer: BangDreamer)
}
