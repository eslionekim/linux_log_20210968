# 2주차 수업 내용
## 계정만들고 부팅 및 종료
![image](https://github.com/user-attachments/assets/620ad3c2-e685-4163-b18c-3f75d06112f8)
![image](https://github.com/user-attachments/assets/e221f779-b69a-4b93-a95e-18f8a2aeba75)

# 3주차 수업 내용
## 일반 파일, 심볼릭링크, 하드링크 만들고 삭제해보기
![image](https://github.com/user-attachments/assets/e955931e-c47f-4422-bfcf-4109cfe603c5)

# 3주차 간략 문제
## 1. 현재 사용자 홈 디렉터리의 폴더 목록을 list.txt로 리다이렉션하시오.
ls -d ~/*/ > list.txt : 목록표시/디렉터리만/현재사용자 홈 디렉터리/결과를 리다이렉션
~: 현재 로그인한 사용자의 홈 디렉토리 /*(모든 파일,디렉터리)/(디렉터리)

## 2. /를 대상으로 하루(1일) 이내 변경된 모든 파일 검색
find / -mtime –1 –type f

## 3. 특정 설정 파일(game_config.xml)을 검색하기
find / –name “game_config.xml”

## 4. 하드링크와 심볼릭 링크의 차이점
하드링크는 원본 파일 제거해도 살아있고, 심볼릭 링크는 원본 파일 제거하면 찾을 수 없다.

## 5. /root의 alias 이름을 포함하는 파일명과 행번호를 출력하시오.
grep -rn "alias" /root

# 4주차 수업 내용
## 사용자 계정 관리
![image](https://github.com/user-attachments/assets/24e4753d-2765-4927-be5f-a95eb4f068a8)
## 사용자 그룹
![image](https://github.com/user-attachments/assets/bbe23300-aa02-49b1-be79-695d0edf7ce8)
## putty 접속
![image](https://github.com/user-attachments/assets/a0447e4d-3cf2-47fb-8368-bf376c87a6c4)

# 4주차 간략 문제
## 1.adduser 명령어로 홈 디렉토리를 지정하여 test 사용자를 새성하시오.
sudo adduser  --home /home/원하는 test

## 2.test사용자의 패스워드를 지정과 함께 최소일 7일, 최대일 10일로 설정하시오.
sudo passwd test : test 패스워드 지정
sudo chage –m 7 –M 10 test: -m 최소일 –M 최대일

## 3. 현재 test 사용자의 gid그룹은 무엇인가?id로 확인하라.
id test

## 4. gid 3000번 new그룹, 3005번 old그룹을 2개 생성하시오
sudo groupadd –g 3000 new
sudo groupadd -g 3005 old

## 5. 사용자 test의 주그룹으로는 new,보조그룹으로는 old를 추가하시오. id로 확인 기존그룹이 존재하는 경우 new로 다시 변경
sudo usermod –g new test : 그룹 변경
sudo usermod –g –G old test : 보조그룹 추가
id test

## 6. 사용자 test를 홈 디렉토리를 포함하여 모두 삭제하시오. 
sudo userdel –rf test

# 5주차 수업 내용
## 파일 및 디렉토리 권한 확인하고 바꿔보기
![image](https://github.com/user-attachments/assets/da06d3bc-1128-4128-af8e-4a92c44a0ccc)
![image](https://github.com/user-attachments/assets/202f00b1-0a7e-4f97-b254-5f62c165d914)
## 사용자 그룹 지정
![image](https://github.com/user-attachments/assets/668cfb72-fa94-4941-9542-f4759c15291a)

# 5주차 간략 문제
## 1. 현재 umask기본값은 022인데 폴더 및 디렉 생성 시 권한을 750으로 변경하려면 기본 umask값 몇으로 해야하는가? 027

## 2. 홈 디렉터리에 임시파일 temp.txt 생성하고 소유자,그룹권한을 root:root로 수정하고 허가권한을 700으로 수정
touch /home/temp.txt
sudo chown root:root temp.txt
sudo chmod 700 temp.txt

## 3. temp.txt에 특수권한 추가. setuid를 추가설정후 stat으로 파일 확인
chmod u+s temp.txt 
stat temp.txt

## 4. 파일 속성을 읽기/쓰기까지 가능하고 삭제만 되지않도록 수정
chattr +i 파일명 

# 6주차 수업내용
## 프로세스 관리
![image](https://github.com/user-attachments/assets/392c1ff2-71fb-4d28-bc67-250489a4ad23)
![image](https://github.com/user-attachments/assets/e34933a2-dcbf-4f6b-b8dc-257f17afedab)

# 6주차 간략 문제
## 1. 프로세스에 관련된 설명으로 알맞은 것은? 1
1) 최초의 프로세스인 init은 PID가 1이다
2) 리눅스 부팅 시에 발생하는 프로세스는 exec방식이다
-> fork시스템 호출로 생성
3) 리눅스는 다중 프로세스를 지원하지 않는다
-> 다중 프로세스 지원
4) 새로운 프로세스를 만들 때 기존 프로세스를 일부 변경한다
->fork를 사용해 기존 프로세스 복제

## 2. 다음 명령어는 어떤 유형인가? (find / -name -type d 2>/dev/null > dir.txt &) 백그라운드
포그라운드 프로세스
백그라운드 프로세스
좀비 프로세스
데몬 프로세스
&가 백그라운드에서 실행하게 함

## 3. 그림과 같이 실시간 프로세스를 출력하는 명령어는? top
![image](https://github.com/user-attachments/assets/ef9efc22-89c4-4b14-80a3-123814223ba9)
pstree
jobs
top 답: 시스템에서 실행중인 프로세스 실시간 모니터링 도구

## 4. 서버의 주요 서비스 등록처리를 수행하는 프로세스는?
데몬 프로세스

# 7주차 수업 내용
## 깃허브 연동
![image](https://github.com/user-attachments/assets/ec72a5cb-a01d-478f-879b-201f353a409f)

# 7주차 실습 문제
## 1. 현재 깃허브 업로드는 업로드 할 때마다 아이디, 패스워드(토큰)을 입력 해야한다. 원격 주소를 수정하여 자동 로그인(입력)되도록 수정한다.
git remote set-url origin https://아이디:보안토큰@github.com/아이디/레포지토리 이름
Git add .
Git commit –m “메시지”
Git push origin main

## 2. 깃허브 업로드 스크립트를 부팅할 때 자동으로 1번 실행되도록 자동 스케쥴러에 등록한다. (crontab 활용)
@reboot /home/guest/shell_logs/git_upload.sh
 컨트롤 o (저장), 엔터, 컨트롤 x(빠져나오기)

# 9주차 수업 내용
## wine 설치 후 카카오톡 실행 및 폰트 다운
![image](https://github.com/user-attachments/assets/a77329e9-a632-428f-a350-51e8c9e5542b)

# 9주차 간략 문제
##### 1 새 scsi -> 1GB VDI 2개 -> name: RAID0.vdi , RAID1.vdi
##### 2 터미널 fdisk -l -> RAID0.vdi , RAID1.vdi check
##### 3 fdisk /dev/sdc랑 sdd -> n->p->t(종류변경)->fd(raid타입으로)->p->w(확인 후 종료) : 파티션 생성 및 설정
##### 4 mdadm --create /dev/md/raid0 --level=0 -raid-devices=2 dev/sdd1 /dev/sdc1 : mdadm으로 레이드 그룹 생성
##### 5 mdadm —detail —scan : 생성된 raid 정보 확인
##### 6 mkfs.ext4 /dev/md/raid0 : raid0을 ext4로 포맷
##### 7 mkdir /new_raid0 : 사용할 폴더 생성
##### 8 mount /dev/md/raid0 /new_raid0/ : 마운트
##### 9 df –h : 잘 연동되었는지 확인
![image](https://github.com/user-attachments/assets/b126bcf1-718a-4ecb-af0d-00c4ddbd1d7b)

# 10주차 수업 내용
## 워드 프레스
![image](https://github.com/user-attachments/assets/f9826e56-6bb5-4c94-80ad-6f30ed23fff4)

# 10주차 간략 문제
없음

# 11주차 수업 내용
## 웹서버 관리
![image](https://github.com/user-attachments/assets/1de96ed2-1339-4932-88d8-325d1eff44ef)
![image](https://github.com/user-attachments/assets/b2cf4b69-91fc-46c1-b147-6554dd0f2a96)

# 11주차 간략 문제
## 워드 프레스 보안 실습 후 취약점 스캐너를 통해 문제 확인하고 취약점 정리 후 문제점 해결
![image](https://github.com/user-attachments/assets/5fd60fc7-a8b8-4fd8-83e4-a27990ab3897)
![image](https://github.com/user-attachments/assets/123c7d66-723f-4c58-bc6c-8fef0f9895ef)
![image](https://github.com/user-attachments/assets/15643160-f7d5-468c-9386-1ca4f5f2278d)
## 취약점 
1. 로그인 시스템이 충분히 강하지 않아서 이중 인증 시스템 필요
2. 비밀번호가 너무 일반적임
3. 한 사용자가 허용되지 않는 사용자 이름을 갖고 있음
4. pro 버전을 쓰는 것을 권장
5. 비활성화 된 플러그인이 2개가 있음
## 해결
![image](https://github.com/user-attachments/assets/bd4b270c-c5f0-4138-827d-ca6e7c1020b3)

## 아파치 불필요한 파일 제거(매주 일요일 새벽3시), 웹서버 백업(매주 월요일 새벽 8시)
![image](https://github.com/user-attachments/assets/1f69bf78-bdc7-40da-bf96-5ab570161a7a)

# 12주차 수업 내용
## ZAP을 활용하여 사이트 공격해보기
![image](https://github.com/user-attachments/assets/1a7e58d8-b7bf-4e0f-b2d8-6a242aaad408)

# 12주차 간략 문제
## Zap에서 데모 사이트 취약점 스캔 후 대표 취약성 상위 5개와 해결책 정리
![image](https://github.com/user-attachments/assets/2e31e9af-b7f7-42f0-b1f5-fc51c5e6110f)
# 상위 5개 취약점과 해결책
##### (1) Cross Site Scripting : 입력 값 검증 부족으로 악의적인 스크립트가 삽입되어 실행
사용자 입력을 철저히 검증하고 유효성 검사 수행
##### (2) SQL Injection : SQL 쿼리에 악의적인 코드를 삽입해 데이터베이스를 조작할 수 있음
데이터베이스 계정에 필요한 최소 권한만 할당하거나 사용자 입력을 파라미터화하여 쿼리에 직접 삽입되지 않도록 함.
##### (3) SQL –injection – SQLite : SQLite 쿼리에 사용자 입력이 적절히 필터링 되지 않아 발생
숫자, 문자열 형식을 확인하여 입력 데이터를 검증하거나 SQLAlchemy, Sequelize 활용
##### (4) Absence of Anti-CSRF Token : CSRF 토큰이 없어 공격자가 사용자의 권한으로 악의적 요청을 보낼 수 있음 
CSRF 토큰을 사용하여 각 요청마다 유효성 검사 수행
##### (5) Content Security Policy (CSP) Header Not Set : CSP 헤더가 설정되지 않아 XSS 공격을 막기 어려움
CSP 헤더를 추가하여 공격 막기

# 13주차 수업 내용
## htop을 활용하여 모니터링
![image](https://github.com/user-attachments/assets/e0997fa6-549e-4118-b3df-ed6d10fa6762)

# 13주차 간략 문제
## 실습 진행 후 네트워크 부하 테스트, CPU , 메모리에 끼치는 영향 분석
![image](https://github.com/user-attachments/assets/73c66adb-521a-4ebf-8cf1-a8b1cc83d3eb)
병렬 curl 작업으로 인해 네트워크 대역폭이 포화 상태에 도달하게 되고,
CPU 사용량이 급격하게 증가하게 되며 각 curl 프로세스는 일정한 메모리를 소비하게 된다.
