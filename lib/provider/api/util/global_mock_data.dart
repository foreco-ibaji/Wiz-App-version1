import 'package:ibaji/model/dashboard/dashboard.dart';
import 'package:ibaji/model/member/member.dart';
import 'package:ibaji/model/mission_detail/mission_detail.dart';

import '../../../model/mission/mission.dart';

const Mission tmpMission = Mission(
    id: 1,
    kind: "WIZ",
    title: "쓰레기 퍼즐 맞추기",
    description: "조각난 쓰레기 퍼즐을 보고배출방법 맞추기",
    difficulty: "LOW",
    rewardPoint: 2000,
    totalCount: 100,
    totalNumberOfParticipating: 10,
    personalParticipatingCount: 0,
    personalCount: 5,
    iconUrl: "url",
    missionUrl: null);

const MissionDetail tmpMissionDetail = MissionDetail(
    missionInfo: MissionInfo(
        rewardPoint: 2000,
        title: "쓰레기 퍼즐 맞추기",
        description: "아래에 조각난 쓰레기는 무엇일까요?",
        personalParticipatingCount: 1,
        personalCount: 5),
    images: ["", "", "", ""],
    choices: [
      Choice(id: 1, name: "소파"),
      Choice(id: 2, name: "의류"),
      Choice(id: 3, name: "형광등"),
      Choice(id: 4, name: "소주병")
    ],
    answer: Answer(
        id: 1,
        name: "소파",
        imageUrl: "소파이미지url",
        disposalMethod: "지자체에 신고 후 버려주세요."));
const Dashboard tmpDashBoard =
    Dashboard(name: "김민서", profileUrl: "profileUrl", point: 2000);

const Member tmpMember = Member(
    accessToken: "accessToken",
    refreshToken: "refreshToken",
    member: MemberInfo(memberId: ""));
