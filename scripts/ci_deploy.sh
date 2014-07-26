if [ "$BRANCH" = "master" ]; then
  echo "deploying master to staging"
  #cap staging deploy
elif [ "$BRANCH" = "production" ]; then
  echo "deploying to production"
  cap production deploy
else
  echo "No deployment for branch: $BRANCH"
fi
