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
## 1. 현재 umask기본값은 022인데 폴더 및 디렉 생성 시 권한을 750으로 변경하고싶어. 기본 umask값 몇으로 해야할까? 027

## 2. 홈 디렉터리에 임시파일 temp.txt 생성하고 소유자,그룹권한을 root:root로 수정하고 허가권한을 700으로 수정
touch /home/temp.txt
sudo chown root:root temp.txt
sudo chmod 700 temp.txt

## 3. temp.txt에 특수권한 추가. setuid를 추가설정후 stat으로 파일 확인
chmod u+s temp.txt 
stat temp.txt

## 4. 파일 속성을 읽기/쓰기까지 가능하고 삭제만 되지않도록 수정
chattr +i 파일명 

