﻿------------------------------
----- Translation for koKR
local L = AceLibrary("AceLocale-2.2"):new("ArcHUD_Core")

L:RegisterTranslations("koKR", function() return {
	-- Core stuff
		CMD_OPTS_FRAME		= "옵션 창 열기",
		CMD_OPTS_DEBUG		= "디버깅 레벨 설정",
		CMD_RESET			= "현재 케릭터 설정을 기본값으로 초기화합니다.",
		CMD_RESET_HELP		= "이 옵션에 대해 당신이 알아야할 두가지가 있습니다., 첫째로, 설정을 CONFIRM을 쳐서 초기화를 할수있습니다. 애드온은 이후에 뜨는창에 옵션에 대한 정보가 뜰겁니다",
		CMD_RESET_CONFIRM	= "처음 설치시 기본 설정으로 되돌립니다.",
		TEXT_RESET			= "정말로 당신의 설정을 초기화하려 한다면 확인을 위해 CONFIRM을 입력하세요.",
		TEXT_RESET_CONFIRM	= "모든 설정이 기본값으로 초기화 되었습니다.",

		FONT				= "2002.ttf",

		["Version: "]		= "버전: ",
		["Author: "]		= "제작자: ",

	--	Options
		TEXT = {
			TITLE		= "ArcHUD 옵션",

			DISPLAY		= "디스플레이 옵션",
			TARGETFRAME	= "대상 프레임",
			PLAYERMODEL	= "플레이어 3D 사진",
			MOBMODEL	= "몹 3D 사진",
			SHOWGUILD	= "플레이어 길드 표시",
			SHOWCLASS	= "대상 직업 표시",
			SHOWBUFFS 	= "버프/디버프 표시",
			SHOWCOMBO	= "연계 포인트 글자 표시",
			SHOWPVP		= "플레이어 PVP상태 깃발 표시",
			ATTACHTOP	= "대상 프레임을 상단에 표시",
			TOT			= "대상의 대상 사용",
			TOTOT		= "대상의 대상의 대상 사용",
			BLIZZPLAYER = "블리자드 플레이어 프레임 표시",
			BLIZZTARGET = "블리자드 대상 프레임 표시",

			NAMEPLATES	= "이름표 설정",
			NPPLAYER	= "플레이어",
			NPPET		= "소환수",
			NPTARGET	= "대상",
			NPTOT		= "대상의 대상",
			NPTOTOT		= "대상의 대상의 대상",
			NPCOMBAT	= "전투 중 이름표 사용",
                        PETNPFADE	= "소환수 이름표 투명도 조절",
			HOVERMSG	= "이름표 활성화 메세지",
			HOVERDELAY	= "이름표 활성화 지연시간",

			MOVEFRAMES	= "창 이동",
			MFTHUD		= "대상창 고정 해제",
			MFTT		= "대상의 대상창 고정 해제",
			MFTTT		= "대상의 대상의 대상창 고정 해제",
			RESETTHUD	= "대상창 초기화",
			RESETTT		= "대상의 대상창 초기화",
			RESETTTT	= "대상의 대상의 대상창 초기화",

			FADE		= "페이드 설정",
			FADE_FULL	= "항상",
			FADE_OOC	= "비전투시",
			FADE_IC		= "전투시",

			MISC		= "기타 설정",
			WIDTH		= "HUD 넓이",
			YLOC		= "수직 정렬",
			XLOC		= "수평 정렬",
			SCALE		= "크기",

			RINGVIS		= "페이드 조건",
			RINGVIS_1	= "FadeFull: 100% 상태일때",
			RINGVIS_2	= "FadeOOC: 비전투시",
			RINGVIS_3	= "FadeBoth: 100% 또는 비전투시",

			RINGS		= "링 설정",
			RING		= "링",
		},
		TOOLTIP = {
			TARGETFRAME = "전체 대상 프레임 표시를 전환합니다.",
			PLAYERMODEL = "플레이어의 3D 대상 사진 표시를 전환합니다.",
			MOBMODEL	= "몹의 3D 대상 사진 표시를 전환합니다.",
			SHOWGUILD	= "플레이어 길드 정보를 이름 주위에 표시합니다.",
			SHOWCLASS	= "대상 직업 혹은 유형을 표시합니다.",
			SHOWBUFFS	= "버프와 디버프의 표시를 전환합니다.",
			SHOWCOMBO	= "HUD의 가운데에 연계포인트 표시를 전환합니다.",
			SHOWPVP		= "플레이어의 이름표에 PVP상태 표시를 전환합니다.",
			TOT			= "대상의 대상 표시를 사용합니다.",
			TOTOT		= "대상의 대상의 대상 표시를 사용합니다.",
			ATTACHTOP	= "대상 프레임을 링의 하단 대신 상단에 표시합니다.",
			BLIZZPLAYER = "브리자드 플레이어 프레임의 표시를 전환합니다.",
			BLIZZTARGET = "블리자드 대상 프레임의 표시를 전환합니다.",

			NPPLAYER	= "플레이어 이름표의 표시를 전환합니다.",
			NPPET		= "소환수 이름표의 표시를 전환합니다.",
			NPTARGET	= "대상 이름표의 표시를 전환합니다.",
			NPTOT		= "대상의 대상 이름표의 표시를 전환합니다.",
			NPTOTOT		= "대상의 대상의 대상 이름표의 표시를 전환합니다.",
			NPCOMBAT	= "전투 시작 시 항상 이름표 사용을 전환합니다.",
                        PETNPFADE	= "소환수의 만족도에 따른 소환수 이름표 투명도를 자동으로 조절합니다.",
			HOVERMSG	= "대화창에 마우스 입력이 활성화된 이름표의 표시를 전환합니다.",
			HOVERDELAY	= "이름표를 활성화하기 위한 지연시간을 초단위로 설정합니다.",

			MFTHUD		= "대상창을 이동하기 위해 고정을 해제 합니다.",
			MFTT		= "대상의 대상창을 이동하기 위해 고정을 해제 합니다.",
			MFTTT		= "대상의 대상의 대상창을 이동하기 위해 고정을 해제 합니다.",
			RESETTHUD	= "대상창을 기본 위치로 초기화합니다.",
			RESETTT		= "대상의 대상창을 기본 위치로 초기화합니다.",
			RESETTTT	= "대상의 대상의 대상창을 기본 위치로 초기화합니다.",

			FADE_FULL	= "100% 상태와 비전투시 투명도를 설정합니다.",
			FADE_OOC	= "비전투시나, 100% 가 아닐때의 투명도를 설정합니다.",
			FADE_IC		= "전투중일때의 투명도를 설정합니다.(페이드 조건이 FadeBoth 나 FadeOOC 일때만)",

			WIDTH		= "링을 가운데로 부터 얼마나 분리 할지를 설정합니다.",
			YLOC		= "ArcHUD 수직 위치를 조절합니다. 값이 클수록 위로, 낮을수록 아래로 내립니다.",
			XLOC		= "ArcHUD 수평 위치를 조절합니다. 값이 클수록 오른쪽으로, 낮을수록 왼쪽으로 이동합니다.",
			SCALE		= "크기를 설정합니다.",

			RINGVIS		= "링을 사라지게할 때를 설정합니다.",
			RINGVIS_1	= "전투상태에 상관없이 링이 100% 일때 희미하게",
			RINGVIS_2	= "상태에 상관없이, 비전투시 항상 사라지게 합니다.",
			RINGVIS_3	= "비전투시 또는, 링이 100% 일때 사라지게 합니다.",
		},
} end)

local LM = AceLibrary("AceLocale-2.2"):new("ArcHUD_Module")



LM:RegisterTranslations("koKR", function() return {
		FONT			= "2002.ttf",

		["Version: "]	= "버전 : ",
		["Author: "]	= "제작자 : ",

		["Health"]			= "플레이어 생명력",
		["Mana"]			= "플레이어 마나",
		["PetHealth"]		= "소환수 생명력",
		["PetMana"]			= "소환수 마나",
		["TargetCasting"]	= "대상 시전",
		["TargetHealth"]	= "대상 생명력",
		["TargetMana"]		= "대상 마나",
		["FocusHealth"]		= "주시대상 생명력",
		["FocusMana"]		= "주시대상 마나",
		["Casting"]			= "시전",
		["DruidMana"]		= "드루이드 마나",
		["MirrorTimer"]		= "미러 타이머",
		["ComboPoints"]		= "연계 포인트",
		["EnergyTick"]		= "기력 틱",

		TEXT = {
			ENABLED		= "사용",
			OUTLINE		= "링 외곽선",
			SHOWTEXT	= "글자 표시",
			SHOWPERC	= "백분율로 표시",
			FLASH		= "최대 연계 포인트일 때 번쩍임",
			SHOWSPELL	= "시전하는 주문 표시",
			SHOWTIME	= "시전 타이머 표시",
			HIDEBLIZZ	= "블리자드 기본 프레임 숨김",
			ENABLEMENU	= "우-클릭 메뉴 사용",
			DEFICIT		= "결손치",
			SHOWINCOMBAT= "전투시 표시",
			SHOWINSTEALTH="은신중 표시",
			ATTACH		= "붙이기",
			SIDE		= "측면",
			LEVEL		= "레벨",
			COLOR		= "링 색상",
			COLORFADE	= "색상 퇴색",
			COLORDEF	= "기본 색상",
			COLORCUST	= "사용자 색상",
			COLORSET	= "링 색상",
			COLORFRIEND = "우호적 링 색상",
			COLORFOE	= "적대적 링 색상",
			COLORMANA 	= "마나 링 색상",
			COLORRAGE	= "분노 링 색상",
			COLORFOCUS 	= "주시대상 링 색상",
			COLORENERGY	= "기력 링 색상",
			ATTACHRING	= "링 분리",
		},
		TOOLTIP = {
			ENABLED		= "링을 켜거나 끕니다.",
			OUTLINE		= "링 주변 외곽선을 전환합니다.",
			SHOWTEXT	= "글자 표시를 전환합니다.(생명력, 마나, 기타..)",
			SHOWPERC	= "백분율 표시를 전환합니다.",
			SHOWSPELL	= "현재 시전중이 주문의 표시를 전환합니다.",
			SHOWTIME	= "시전 타이머 표시를 전환합니다.",
			FLASH		= "최대 연계 포인트시 번쩍임을 전환합니다.",
			HIDEBLIZZ	= "기본 블리자드 프레임 표시를 전환합니다.",
			ENABLEMENU	= "우-클릭 메뉴 켜기/끄기를 전환합니다.",
			DEFICIT		= "생명력 결손치를 전환합니다. (최대 생명력 - 현재 생명력)",
			SHOWINCOMBAT= "전투시 기력 틱 표시를 전환합니다.",
			SHOWINSTEALTH="은신중에 기력 틱 표시를 전환합니다.",
			SIDE		= "붙일 측면을 설정합니다.",
			LEVEL		= "링의 수평 위치를 설정합니다. (<-1: 가운데로, 0: 기본, >1: 가운데에서 멀리)",
			COLOR		= "링 색상에 대한 설정입니다.",
			COLORFADE	= "퇴색을 위한 색상을 설정합니다. (생명력에 대해 녹색에서 붉은색으로)",
			COLORDEF	= "기본값으로 링 색상을 설정합니다.",
			COLORCUST	= "링 색상을 사용자 지정 색상으로 설정합니다.",
			COLORSET	= "사용자 링 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORFRIEND	= "우호적 링 사용자 색상을 설정힙니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORFOE	= "적대적 링 사용자 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORMANA	= "마나 링 사용자 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORRAGE	= "분노 링 사용자 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORFOCUS	= "주시대상 링 사용자 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			COLORENERGY	= "기력 링 사용자 색상을 설정합니다. (사용자 색상 모드 선택 시에만 적용됩니다)",
			ATTACHRING	= "기본 프레임 앵커에 링의 결합을 전환합니다. (선택시 기본 링처럼 동작할 것입니다.)",
		},
		SIDE = {
			LEFT		= "좌측 고정위치",
			RIGHT		= "우측 고정위치",
		},

		["You gain Prowl."] = "숨기 효과를 얻었습니다.",
		["Prowl fades from you."] = "숨기 효과가 사라졌습니다.",
		["You gain Stealth."] = "은신 효과를 얻었습니다.",
		["Stealth fades from you."] = "은신 효과가 사라졌습니다.",
} end)