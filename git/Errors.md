# Errors

## [Contribution not showing up](https://help.github.com/en/github/setting-up-and-managing-your-github-profile/why-are-my-contributions-not-showing-up-on-my-profile)

git config --list 를 해도 아무런 문제가 없는데 그냥 contribution이 안오른다. 공식 문서에 따르면 다양한 이유가 있다.

나 같은 경우는 그냥, commit을 한 후 충분한 시간이 흐르지 않았기 때문에 반영이 안 된 것이었다.

github는 commit을 push 할 때마다 실시간으로 contribution을 올려주는 것이 아니라, 일정한 시간 후에 업데이트 한다. 이 시간이 매우 짧아 실시간 처럼 보일 때가 많지만, 아닐 때도 있다. 방금의 나의 경우 처럼

## git not ignoring

git 에서 관리를 하고 있던 파일 혹은 디렉토리를 ignore에 넣어 없애버리고 싶다. 실수로 ignore에 포함시키지 않았다가 나중에 발견하는 경우가 이럴 것이다. 그런데 .gitignore에 추가를 해도 `git status`에 `deleted` 가 뜨거나 하등 변화가 없다. 이유는 아마 깃이 이미 해당 파일들을 트래킹하고 있기 때문일 것이다.

해결방법은 간단하다. 우선 이 파일들을 삭제 (임시 폴더에 옮김) 하고 git add. git commit 을 하여 깃에서 제거한다. 후에 .gitignore에 해당 파일 이름을 기입하고 다시 가져오면 이제는 git에서 무시된다.