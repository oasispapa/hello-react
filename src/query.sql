SELECT
    m.bot_id,
    m.dialog_id,
    m.dialog_title,
    m.node_type,
    m.node_type_nm,
    m.message,
    m.table_nm,
    m.col,
    m.col_nm
FROM
    (
        /* SLOT normal */
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsq.question AS message,
            'question' AS col,
            '질문 내용' AS col_nm,
            'tbl_cnc_slot_question' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_cnc_slot_detail tcsd ON tcsd.slot_node_id = tcs.id
            AND tcsd.is_del = 'N'
            INNER JOIN tbl_cnc_slot_question tcsq ON tcsd.id = tcsq.slot_detail_id
            AND tcsq.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT' -- and tcsq.type = 'GENERAL' 
            /* SLOT multi modal */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcs.on_start_message AS message,
            'on_start_message' AS col,
            '화면 시작 TTS 메세지' AS col_nm,
            'tbl_cn_slot' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcs.on_submit_message AS message,
            'on_submit_message' AS col,
            '화면 완료 TTS 메세지' AS col_nm,
            'tbl_cn_slot' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcs.on_close_message AS message,
            'on_close_message' AS col,
            '화면 취소 TTS 메세지' AS col_nm,
            'tbl_cn_slot' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
            /* SLOT multi modal2 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.on_retry_message AS message,
            'on_retry_message' AS col,
            '일반 Retry TTS 메세지' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcs.cn_slot_multi_modal_info_id = tcsmi.id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.on_over_retry_message AS message,
            'on_over_retry_message' AS col,
            '마지막 Retry TTS 메세지' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcs.cn_slot_multi_modal_info_id = tcsmi.id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.timeout_message AS message,
            'timeout_message' AS col,
            'Timeout 메세지 (Alert)' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '슬롯노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slot tcs ON tcn.id = tcs.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcs.cn_slot_multi_modal_info_id = tcsmi.id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLOT'
            AND tcs.slot_type = 'MULTI_MODAL'
            /* 답변 multi modal */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcb.on_start_message AS message,
            'on_start_message' AS col,
            '화면 시작 TTS메시지' AS col_nm,
            'tbl_cn_basic' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_cn_basic tcb
            INNER JOIN tbl_manage_template tmt ON tmt.id = tcb.multi_modal_template_id
            INNER JOIN tbl_chat_node tcn ON tcb.id = tcn.id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tmt.is_del = 'N'
            AND tcn.type = 'BASIC'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcb.on_init_message_android AS message,
            'on_init_message_android' AS col,
            '인앱 성공 TTS 메세지 (Android)' AS col_nm,
            'tbl_cn_basic' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_cn_basic tcb
            INNER JOIN tbl_manage_template tmt ON tmt.id = tcb.multi_modal_template_id
            INNER JOIN tbl_chat_node tcn ON tcb.id = tcn.id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tmt.is_del = 'N'
            AND tcn.type = 'BASIC'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcb.on_init_message_ios AS message,
            'on_init_message_ios' AS col,
            '인앱 성공 TTS 메세지 (IOS)' AS col_nm,
            'tbl_cn_basic' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_cn_basic tcb
            INNER JOIN tbl_manage_template tmt ON tmt.id = tcb.multi_modal_template_id
            INNER JOIN tbl_chat_node tcn ON tcb.id = tcn.id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tmt.is_del = 'N'
            AND tcn.type = 'BASIC'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcb.on_init_message AS message,
            'on_init_message' AS col,
            '멀티모달 진입 TTS 메세지' AS col_nm,
            'tbl_cn_basic' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_cn_basic tcb
            INNER JOIN tbl_manage_template tmt ON tmt.id = tcb.multi_modal_template_id
            INNER JOIN tbl_chat_node tcn ON tcb.id = tcn.id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tmt.is_del = 'N'
            AND tcn.type = 'BASIC'
            /* 답변 multi modal2 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.after_callgate_inapp_fail_message AS message,
            'after_callgate_inapp_fail_message' AS col,
            '인앱 런처 불가 시, TTS 메세지' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_basic tcb ON tcb.id = tcn.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcsmi.id = tcb.cn_slot_multi_modal_info_id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'BASIC'
            AND tcn.is_del = 'N'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.after_callgate_fail_message AS message,
            'after_callgate_fail_message' AS col,
            '피쳐폰 / 콜게이트 연동 장애 시, TTS 메세지' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_basic tcb ON tcb.id = tcn.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcsmi.id = tcb.cn_slot_multi_modal_info_id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'BASIC'
            AND tcn.is_del = 'N'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcsmi.after_callgate_inapp_fail_sms AS message,
            'after_callgate_inapp_fail_sms' AS col,
            '인앱 런처 불가 시, 전송할 SMS 메세지' AS col_nm,
            'tbl_cn_slot_multimodal_info' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_basic tcb ON tcb.id = tcn.id
            INNER JOIN tbl_cn_slot_multimodal_info tcsmi ON tcsmi.id = tcb.cn_slot_multi_modal_info_id
            AND tcsmi.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'BASIC'
            AND tcn.is_del = 'N'
            /* 답변 일반 (버블) - FAQ 제외 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcbt.message,
            'message' AS col,
            '버블 답변' AS col_nm,
            'tbl_cnc_bubble_text' AS table_nm,
            '답변노드' AS node_type_nm
        FROM
            tbl_cnc_bubble_text tcbt
            INNER JOIN tbl_cnc_bubble tcb ON tcb.id = tcbt.bubble_id
            AND tcb.is_del = 'N'
            INNER JOIN tbl_chat_node tcn ON tcb.chat_node_id = tcn.id
            AND tcn.is_del = 'N'
            AND tcn.type = 'BASIC'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcbt.is_del = 'N'
            AND NOT EXISTS (
                SELECT
                    'z'
                FROM
                    tbl_intent ti
                WHERE
                    ti.dialog_id = tcn.dialog_id
                    AND ti.is_del = 'N'
                    AND ti.type = 'FAQ'
            )
            /* 호전환 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcc.success_msg AS message,
            'success_msg' AS col,
            '성공메시지' AS col_nm,
            'tbl_cn_call' AS table_nm,
            '호전환노드' AS node_type_nm
        FROM
            tbl_cn_call tcc
            INNER JOIN tbl_chat_node tcn ON tcc.id = tcn.id
            AND tcn.is_del = 'N'
            AND tcn.type = 'VUX_CALL'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcc.fail_msg AS message,
            'fail_msg' AS col,
            '실패메시지' AS col_nm,
            'tbl_cn_call' AS table_nm,
            '호전환노드' AS node_type_nm
        FROM
            tbl_cn_call tcc
            INNER JOIN tbl_chat_node tcn ON tcc.id = tcn.id
            AND tcn.is_del = 'N'
            AND tcn.type = 'VUX_CALL'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
            /* 콜종료 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcce.call_end_text AS message,
            'call_end_text' AS col,
            '종료메시지' AS col_nm,
            'tbl_cn_call_end' AS table_nm,
            '콜종료노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_call_end tcce ON tcn.id = tcce.id
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'CALL_END'
            AND tcn.is_del = 'N'
            /* 스피커 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tctut.text AS message,
            'text' AS col,
            'TTS발화 메세지' AS col_nm,
            'tbl_cnc_tts_utter_text' AS table_nm,
            '스피커노드' AS node_type_nm
        FROM
            tbl_cnc_tts_utter_text tctut
            INNER JOIN tbl_chat_node tcn ON tcn.id = tctut.chat_node_id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'SPEAKER'
            /* 슬라이드 - TTS발화메세지 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tctut.text AS message,
            'text' AS col,
            'TTS발화 메시지' AS col_nm,
            'tbl_cnc_tts_utter_text' AS table_nm,
            '슬라이드노드' AS node_type_nm
        FROM
            tbl_cnc_tts_utter_text tctut
            INNER JOIN tbl_chat_node tcn ON tcn.id = tctut.chat_node_id
            AND tcn.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.type = 'SLIDE'
            /* 슬라이드 - 랜덤답변 */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            tcn.TYPE AS node_type,
            tcs2.slide_text AS message,
            'slide_text' AS col,
            '컨텐츠타입 답변' AS col_nm,
            'tbl_cnc_slide' AS table_nm,
            '슬라이드노드' AS node_type_nm
        FROM
            tbl_chat_node tcn
            INNER JOIN tbl_cn_slide tcs ON tcs.id = tcn.id
            INNER JOIN tbl_cnc_slide tcs2 ON tcs.id = tcs2.slide_node_id
            AND tcs2.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tcn.is_del = 'N'
            AND tcn.type = 'SLIDE'
            /* FAQ */
        UNION
        ALL
        SELECT
            tb.id AS bot_id,
            tcn.dialog_id,
            td.name AS dialog_title,
            'FAQ' AS node_type,
            bu_text.message AS message,
            'message' AS col,
            '답변' AS col_nm,
            'tbl_cnc_bubble_text' AS table_nm,
            'FAQ' AS node_type_nm
        FROM
            tbl_intent intent
            INNER JOIN tbl_chat_node tcn ON tcn.dialog_id = intent.dialog_id
            AND tcn.is_del = 'N'
            AND tcn.type = 'BASIC'
            INNER JOIN tbl_cnc_bubble bubble ON bubble.chat_node_id = tcn.id
            AND bubble.is_del = 'N'
            INNER JOIN tbl_cnc_bubble_text bu_text ON bu_text.bubble_id = bubble.id
            AND bu_text.is_del = 'N'
            INNER JOIN tbl_dialog td on td.id = tcn.dialog_id
            AND td.is_del = 'N'
            INNER JOIN tbl_bot tb ON td.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            intent.type = 'FAQ'
            AND intent.is_del = 'N'
            /* 봇발화 스크립트 */
        UNION
        ALL
        SELECT
            tts.bot_id,
            -1 AS dialog_id,
            '(봇발화스크립트)' AS dialog_title,
            'BOT_SPEAK_SCRIPT' AS node_type,
            tts.value AS message,
            'value' AS col,
            '봇 발화 스크립트 Value' AS col_nm,
            'tbl_text_script' AS table_nm,
            '봇발화스크립트' AS node_type_nm
        FROM
            tbl_text_script tts
            INNER JOIN tbl_bot tb ON tts.bot_id = tb.id
            AND tb.is_del = 'N'
        WHERE
            tts.is_del = 'N'
    ) AS m
WHERE
    m.message IS NOT NULL
    AND m.bot_id IN (483, 488)
    AND m.dialog_id IN (70895, 76241, 76465, -1)
ORDER BY
    bot_id,
    node_type,
    table_nm,
    col,
    message
LIMIT
    10 offset 0