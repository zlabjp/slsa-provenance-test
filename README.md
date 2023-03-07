# slsa-provenance-test

This is only used for testing [slsa-github-generator](https://github.com/slsa-framework/slsa-github-generator) and [slsa-verifier](https://github.com/slsa-framework/slsa-verifier).

The latest version of slsa-github-generator (`v1.5.0`) does not fully support private Sigstore tools (Rekor, Fulcio) 
and this repo's software supply chain metadata is exposed to the public Rekor instance as transparency logs.

## Artifacts

### Binary files

The Actions workflow uploads binary files to GitHub releases.

#### Find transparency logs

e.g.
```
$ rekor-cli search --artifact https://github.com/zlabjp/slsa-provenance-test/releases/download/v0.0.5/binary-linux-amd64.intoto.jsonl
Found matching entries (listed by UUID):
24296fb24b8ad77a17147418d4dedc99ed8d9e98d85b5352f272967d8ff0cbbda3e4273741174abc
```

```
$ rekor-cli get --uuid 24296fb24b8ad77a17147418d4dedc99ed8d9e98d85b5352f272967d8ff0cbbda3e4273741174abc
LogID: c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d
Attestation: {"_type":"https://in-toto.io/Statement/v0.1","predicateType":"https://slsa.dev/provenance/v0.2","subject":[{"name":"binary-linux-amd64","digest":{"sha256":"9f7014682b7842169f789b8c79041d70313de0a592a94413a247f5a6047167cd"}}],"predicate":{"builder":{"id":"https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_go_slsa3.yml@refs/tags/v1.5.0"},"buildType":"https://github.com/slsa-framework/slsa-github-generator/go@v1","invocation":{"configSource":{"uri":"git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5","digest":{"sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4"},"entryPoint":".github/workflows/slsa-provenance.yml"},"parameters":{},"environment":{"arch":"X64","github_actor":"hiyosi","github_actor_id":"948760","github_base_ref":"","github_event_name":"push","github_event_payload":{"after":"24acc49548454b2f21a01a85d3357fc1858abdf4","base_ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","commits":[],"compare":"https://github.com/zlabjp/slsa-provenance-test/compare/v0.0.5","created":true,"deleted":false,"forced":false,"head_commit":{"author":{"email":"948760+tousami@users.noreply.github.com","name":"Tomoya Usami","username":"hiyosi"},"committer":{"email":"948760+tousami@users.noreply.github.com","name":"Tomoya Usami","username":"hiyosi"},"distinct":true,"id":"24acc49548454b2f21a01a85d3357fc1858abdf4","message":"Fix workflow","timestamp":"2023-03-07T15:05:05+09:00","tree_id":"01ad9f737dce5933462b8389426b30231800e836","url":"https://github.com/zlabjp/slsa-provenance-test/commit/24acc49548454b2f21a01a85d3357fc1858abdf4"},"organization":{"avatar_url":"https://avatars.githubusercontent.com/u/16043808?v=4","description":"","events_url":"https://api.github.com/orgs/zlabjp/events","hooks_url":"https://api.github.com/orgs/zlabjp/hooks","id":16043808,"issues_url":"https://api.github.com/orgs/zlabjp/issues","login":"zlabjp","members_url":"https://api.github.com/orgs/zlabjp/members{/member}","node_id":"MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4","public_members_url":"https://api.github.com/orgs/zlabjp/public_members{/member}","repos_url":"https://api.github.com/orgs/zlabjp/repos","url":"https://api.github.com/orgs/zlabjp"},"pusher":{"email":"948760+hiyosi@users.noreply.github.com","name":"hiyosi"},"ref":"refs/tags/v0.0.5","repository":{"allow_forking":true,"archive_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/{archive_format}{/ref}","archived":false,"assignees_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/assignees{/user}","blobs_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/blobs{/sha}","branches_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/branches{/branch}","clone_url":"https://github.com/zlabjp/slsa-provenance-test.git","collaborators_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/collaborators{/collaborator}","comments_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/comments{/number}","commits_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/commits{/sha}","compare_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/compare/{base}...{head}","contents_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/contents/{+path}","contributors_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/contributors","created_at":1678061028,"default_branch":"main","deployments_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/deployments","description":null,"disabled":false,"downloads_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/downloads","events_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/events","fork":false,"forks":0,"forks_count":0,"forks_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/forks","full_name":"zlabjp/slsa-provenance-test","git_commits_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/commits{/sha}","git_refs_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/refs{/sha}","git_tags_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/tags{/sha}","git_url":"git://github.com/zlabjp/slsa-provenance-test.git","has_discussions":false,"has_downloads":true,"has_issues":true,"has_pages":false,"has_projects":true,"has_wiki":true,"homepage":null,"hooks_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/hooks","html_url":"https://github.com/zlabjp/slsa-provenance-test","id":610034745,"is_template":false,"issue_comment_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/comments{/number}","issue_events_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/events{/number}","issues_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues{/number}","keys_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/keys{/key_id}","labels_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/labels{/name}","language":"Dockerfile","languages_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/languages","license":null,"master_branch":"main","merges_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/merges","milestones_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/milestones{/number}","mirror_url":null,"name":"slsa-provenance-test","node_id":"R_kgDOJFxkOQ","notifications_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/notifications{?since,all,participating}","open_issues":0,"open_issues_count":0,"organization":"zlabjp","owner":{"avatar_url":"https://avatars.githubusercontent.com/u/16043808?v=4","email":null,"events_url":"https://api.github.com/users/zlabjp/events{/privacy}","followers_url":"https://api.github.com/users/zlabjp/followers","following_url":"https://api.github.com/users/zlabjp/following{/other_user}","gists_url":"https://api.github.com/users/zlabjp/gists{/gist_id}","gravatar_id":"","html_url":"https://github.com/zlabjp","id":16043808,"login":"zlabjp","name":"zlabjp","node_id":"MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4","organizations_url":"https://api.github.com/users/zlabjp/orgs","received_events_url":"https://api.github.com/users/zlabjp/received_events","repos_url":"https://api.github.com/users/zlabjp/repos","site_admin":false,"starred_url":"https://api.github.com/users/zlabjp/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/zlabjp/subscriptions","type":"Organization","url":"https://api.github.com/users/zlabjp"},"private":false,"pulls_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/pulls{/number}","pushed_at":1678169356,"releases_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/releases{/id}","size":23,"ssh_url":"git@github.com:zlabjp/slsa-provenance-test.git","stargazers":0,"stargazers_count":0,"stargazers_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/stargazers","statuses_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/statuses/{sha}","subscribers_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/subscribers","subscription_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/subscription","svn_url":"https://github.com/zlabjp/slsa-provenance-test","tags_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/tags","teams_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/teams","topics":[],"trees_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/trees{/sha}","updated_at":"2023-03-07T02:03:30Z","url":"https://github.com/zlabjp/slsa-provenance-test","visibility":"public","watchers":0,"watchers_count":0,"web_commit_signoff_required":false},"sender":{"avatar_url":"https://avatars.githubusercontent.com/u/948760?v=4","events_url":"https://api.github.com/users/hiyosi/events{/privacy}","followers_url":"https://api.github.com/users/hiyosi/followers","following_url":"https://api.github.com/users/hiyosi/following{/other_user}","gists_url":"https://api.github.com/users/hiyosi/gists{/gist_id}","gravatar_id":"","html_url":"https://github.com/hiyosi","id":948760,"login":"hiyosi","node_id":"MDQ6VXNlcjk0ODc2MA==","organizations_url":"https://api.github.com/users/hiyosi/orgs","received_events_url":"https://api.github.com/users/hiyosi/received_events","repos_url":"https://api.github.com/users/hiyosi/repos","site_admin":false,"starred_url":"https://api.github.com/users/hiyosi/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/hiyosi/subscriptions","type":"User","url":"https://api.github.com/users/hiyosi"}},"github_head_ref":"","github_ref":"refs/tags/v0.0.5","github_ref_type":"tag","github_repository_id":"610034745","github_repository_owner":"zlabjp","github_repository_owner_id":"16043808","github_run_attempt":"1","github_run_id":"4351212002","github_run_number":"34","github_sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4","os":"ubuntu22"}},"buildConfig":{"steps":[{"workingDir":"/home/runner/work/slsa-provenance-test/slsa-provenance-test/__PROJECT_CHECKOUT_DIR__","command":["/opt/hostedtoolcache/go/1.19.6/x64/bin/go","mod","vendor"],"env":null},{"workingDir":"/home/runner/work/slsa-provenance-test/slsa-provenance-test/__PROJECT_CHECKOUT_DIR__","command":["/opt/hostedtoolcache/go/1.19.6/x64/bin/go","build","-mod=vendor","-trimpath","-tags=netgo","-ldflags=-X main.Version=0.0.5","-o","binary-linux-amd64","main.go"],"env":["GOOS=linux","GOARCH=amd64","CGO_ENABLED=0"]}],"version":1},"metadata":{"buildInvocationID":"4351212002-1","completeness":{"parameters":true,"environment":false,"materials":false},"reproducible":false},"materials":[{"uri":"git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5","digest":{"sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4"}},{"uri":"https://github.com/actions/virtual-environments/releases/tag/ubuntu22/20230227.2"}]}}
Index: 14844601
IntegratedTime: 2023-03-07T06:12:00Z
UUID: 24296fb24b8ad77a17147418d4dedc99ed8d9e98d85b5352f272967d8ff0cbbda3e4273741174abc
Body: {
  "IntotoObj": {
    "content": {
      "hash": {
        "algorithm": "sha256",
        "value": "72618aaad0b14687218d6af3f0655b61e2c7d81b2e51d46b16c64a9cddaf0d4e"
      },
      "payloadHash": {
        "algorithm": "sha256",
        "value": "c9621b480d137b6dc57fbda18d365be9b661099d5fbccfe16a1cf71d7bb91cff"
      }
    },
    "publicKey": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUR3akNDQTBtZ0F3SUJBZ0lVT3BrUWFuYmNwcU9HbWxhOFYvQVdTa2JNelRnd0NnWUlLb1pJemowRUF3TXcKTnpFVk1CTUdBMVVFQ2hNTWMybG5jM1J2Y21VdVpHVjJNUjR3SEFZRFZRUURFeFZ6YVdkemRHOXlaUzFwYm5SbApjbTFsWkdsaGRHVXdIaGNOTWpNd016QTNNRFl4TWpBd1doY05Nak13TXpBM01EWXlNakF3V2pBQU1Ga3dFd1lICktvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUV0MHltR0dtZXJnNDZvU2puTzJuUEdSY0F3ZmFZQU50cmFNTTAKV1Y1TGU0N0JjSDlzWExBNDBwYjdYV1dNYU15ZkVVSmxzNDhrR3dzNFJCQzBLR0t1TUtPQ0FtZ3dnZ0prTUE0RwpBMVVkRHdFQi93UUVBd0lIZ0RBVEJnTlZIU1VFRERBS0JnZ3JCZ0VGQlFjREF6QWRCZ05WSFE0RUZnUVVRN2xsCkVpbGJ5czlCdllqdmNtcURlUGtLeldzd0h3WURWUjBqQkJnd0ZvQVUzOVBwejFZa0VaYjVxTmpwS0ZXaXhpNFkKWkQ4d2ZRWURWUjBSQVFIL0JITXdjWVp2YUhSMGNITTZMeTluYVhSb2RXSXVZMjl0TDNOc2MyRXRabkpoYldWMwpiM0pyTDNOc2MyRXRaMmwwYUhWaUxXZGxibVZ5WVhSdmNpOHVaMmwwYUhWaUwzZHZjbXRtYkc5M2N5OWlkV2xzClpHVnlYMmR2WDNOc2MyRXpMbmx0YkVCeVpXWnpMM1JoWjNNdmRqRXVOUzR3TURrR0Npc0dBUVFCZzc4d0FRRUUKSzJoMGRIQnpPaTh2ZEc5clpXNHVZV04wYVc5dWN5NW5hWFJvZFdKMWMyVnlZMjl1ZEdWdWRDNWpiMjB3RWdZSwpLd1lCQkFHRHZ6QUJBZ1FFY0hWemFEQTJCZ29yQmdFRUFZTy9NQUVEQkNneU5HRmpZelE1TlRRNE5EVTBZakptCk1qRmhNREZoT0RWa016TTFOMlpqTVRnMU9HRmlaR1kwTUI0R0Npc0dBUVFCZzc4d0FRUUVFRk5NVTBFZ1oyOGcKY21Wc1pXRnpaWEl3S1FZS0t3WUJCQUdEdnpBQkJRUWJlbXhoWW1wd0wzTnNjMkV0Y0hKdmRtVnVZVzVqWlMxMApaWE4wTUI0R0Npc0dBUVFCZzc4d0FRWUVFSEpsWm5NdmRHRm5jeTkyTUM0d0xqVXdnWXNHQ2lzR0FRUUIxbmtDCkJBSUVmUVI3QUhrQWR3RGRQVEJxeHNjUk1tTVpIaHlaWnpjQ29rcGV1TjQ4cmYrSGluS0FMeW51amdBQUFZYTYKc3Jsd0FBQUVBd0JJTUVZQ0lRQzFyQUxDMzJwMlZoRElaM1FKT0t3c3Fna2d4OWs3R1BnRHdDVVlheWxyRXdJaApBTmdueklTbXltZGhacmtwM1ZqK1gvMy9MOE82ckczV3k5SSsvS3BnSUpPaU1Bb0dDQ3FHU000OUJBTURBMmNBCk1HUUNNR0cvT25zYWhUQUhXOGtVNkxYQ3FsVCtFLzVUNnRYMkZjR0RUYnFwS3RsWVppNjNHVmQrbXE4aGJIb2UKdEhleHJ3SXdYVElqUjd0NlkwcVpWdmd2bXhycnZ5bTZlcFJwOW5xTytFSGhYbkF4dXQzY0QxZGZjQ2lxK1BNWgpLMU1TOEZKSgotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
  }
}
```

### Verify

```
$ slsa-verifier verify-artifact "binary-linux-amd64"
                --provenance-path "binary-linux-amd64.intoto.jsonl"
                --source-uri "github.com/zlabjp/slsa-provenance-test" \
                --source-tag "v0.0.5"   
```


## Container images

The Actions workflow pushes images to GitHub packages.


### Find transparency logs

search entries by container's hash value
```
$ > rekor-cli search --sha "18d935906bbac62909c4a301616046a373f1f4ce714cdddf452a2381354034c0"
Found matching entries (listed by UUID):
24296fb24b8ad77a3c4acd8f2f5e8f656c9743bd79f682cc16e6927ff202acaa9c77d7908e07a076
```

```
> rekor-cli get --uuid "24296fb24b8ad77a3c4acd8f2f5e8f656c9743bd79f682cc16e6927ff202acaa9c77d7908e07a076"
LogID: c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d
Attestation: {"_type":"https://in-toto.io/Statement/v0.1","predicateType":"https://slsa.dev/provenance/v0.2","subject":[{"name":"ghcr.io/zlabjp/slsa-provenance-test","digest":{"sha256":"18d935906bbac62909c4a301616046a373f1f4ce714cdddf452a2381354034c0"}}],"predicate":{"builder":{"id":"https://github.com/zlabjp/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/heads/fix-cosign-flag"},"buildType":"https://github.com/slsa-framework/slsa-github-generator/container@v1","invocation":{"configSource":{"uri":"git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5","digest":{"sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4"},"entryPoint":".github/workflows/slsa-provenance.yml"},"parameters":{},"environment":{"github_actor":"hiyosi","github_actor_id":"948760","github_base_ref":"","github_event_name":"push","github_event_payload":{"after":"24acc49548454b2f21a01a85d3357fc1858abdf4","base_ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","commits":[],"compare":"https://github.com/zlabjp/slsa-provenance-test/compare/v0.0.5","created":true,"deleted":false,"forced":false,"head_commit":{"author":{"email":"948760+tousami@users.noreply.github.com","name":"Tomoya Usami","username":"hiyosi"},"committer":{"email":"948760+tousami@users.noreply.github.com","name":"Tomoya Usami","username":"hiyosi"},"distinct":true,"id":"24acc49548454b2f21a01a85d3357fc1858abdf4","message":"Fix workflow","timestamp":"2023-03-07T15:05:05+09:00","tree_id":"01ad9f737dce5933462b8389426b30231800e836","url":"https://github.com/zlabjp/slsa-provenance-test/commit/24acc49548454b2f21a01a85d3357fc1858abdf4"},"organization":{"avatar_url":"https://avatars.githubusercontent.com/u/16043808?v=4","description":"","events_url":"https://api.github.com/orgs/zlabjp/events","hooks_url":"https://api.github.com/orgs/zlabjp/hooks","id":16043808,"issues_url":"https://api.github.com/orgs/zlabjp/issues","login":"zlabjp","members_url":"https://api.github.com/orgs/zlabjp/members{/member}","node_id":"MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4","public_members_url":"https://api.github.com/orgs/zlabjp/public_members{/member}","repos_url":"https://api.github.com/orgs/zlabjp/repos","url":"https://api.github.com/orgs/zlabjp"},"pusher":{"email":"948760+hiyosi@users.noreply.github.com","name":"hiyosi"},"ref":"refs/tags/v0.0.5","repository":{"allow_forking":true,"archive_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/{archive_format}{/ref}","archived":false,"assignees_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/assignees{/user}","blobs_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/blobs{/sha}","branches_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/branches{/branch}","clone_url":"https://github.com/zlabjp/slsa-provenance-test.git","collaborators_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/collaborators{/collaborator}","comments_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/comments{/number}","commits_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/commits{/sha}","compare_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/compare/{base}...{head}","contents_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/contents/{+path}","contributors_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/contributors","created_at":1678061028,"default_branch":"main","deployments_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/deployments","description":null,"disabled":false,"downloads_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/downloads","events_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/events","fork":false,"forks":0,"forks_count":0,"forks_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/forks","full_name":"zlabjp/slsa-provenance-test","git_commits_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/commits{/sha}","git_refs_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/refs{/sha}","git_tags_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/tags{/sha}","git_url":"git://github.com/zlabjp/slsa-provenance-test.git","has_discussions":false,"has_downloads":true,"has_issues":true,"has_pages":false,"has_projects":true,"has_wiki":true,"homepage":null,"hooks_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/hooks","html_url":"https://github.com/zlabjp/slsa-provenance-test","id":610034745,"is_template":false,"issue_comment_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/comments{/number}","issue_events_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/events{/number}","issues_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/issues{/number}","keys_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/keys{/key_id}","labels_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/labels{/name}","language":"Dockerfile","languages_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/languages","license":null,"master_branch":"main","merges_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/merges","milestones_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/milestones{/number}","mirror_url":null,"name":"slsa-provenance-test","node_id":"R_kgDOJFxkOQ","notifications_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/notifications{?since,all,participating}","open_issues":0,"open_issues_count":0,"organization":"zlabjp","owner":{"avatar_url":"https://avatars.githubusercontent.com/u/16043808?v=4","email":null,"events_url":"https://api.github.com/users/zlabjp/events{/privacy}","followers_url":"https://api.github.com/users/zlabjp/followers","following_url":"https://api.github.com/users/zlabjp/following{/other_user}","gists_url":"https://api.github.com/users/zlabjp/gists{/gist_id}","gravatar_id":"","html_url":"https://github.com/zlabjp","id":16043808,"login":"zlabjp","name":"zlabjp","node_id":"MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4","organizations_url":"https://api.github.com/users/zlabjp/orgs","received_events_url":"https://api.github.com/users/zlabjp/received_events","repos_url":"https://api.github.com/users/zlabjp/repos","site_admin":false,"starred_url":"https://api.github.com/users/zlabjp/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/zlabjp/subscriptions","type":"Organization","url":"https://api.github.com/users/zlabjp"},"private":false,"pulls_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/pulls{/number}","pushed_at":1678169356,"releases_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/releases{/id}","size":23,"ssh_url":"git@github.com:zlabjp/slsa-provenance-test.git","stargazers":0,"stargazers_count":0,"stargazers_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/stargazers","statuses_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/statuses/{sha}","subscribers_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/subscribers","subscription_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/subscription","svn_url":"https://github.com/zlabjp/slsa-provenance-test","tags_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/tags","teams_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/teams","topics":[],"trees_url":"https://api.github.com/repos/zlabjp/slsa-provenance-test/git/trees{/sha}","updated_at":"2023-03-07T02:03:30Z","url":"https://github.com/zlabjp/slsa-provenance-test","visibility":"public","watchers":0,"watchers_count":0,"web_commit_signoff_required":false},"sender":{"avatar_url":"https://avatars.githubusercontent.com/u/948760?v=4","events_url":"https://api.github.com/users/hiyosi/events{/privacy}","followers_url":"https://api.github.com/users/hiyosi/followers","following_url":"https://api.github.com/users/hiyosi/following{/other_user}","gists_url":"https://api.github.com/users/hiyosi/gists{/gist_id}","gravatar_id":"","html_url":"https://github.com/hiyosi","id":948760,"login":"hiyosi","node_id":"MDQ6VXNlcjk0ODc2MA==","organizations_url":"https://api.github.com/users/hiyosi/orgs","received_events_url":"https://api.github.com/users/hiyosi/received_events","repos_url":"https://api.github.com/users/hiyosi/repos","site_admin":false,"starred_url":"https://api.github.com/users/hiyosi/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/hiyosi/subscriptions","type":"User","url":"https://api.github.com/users/hiyosi"}},"github_head_ref":"","github_ref":"refs/tags/v0.0.5","github_ref_type":"tag","github_repository_id":"610034745","github_repository_owner":"zlabjp","github_repository_owner_id":"16043808","github_run_attempt":"1","github_run_id":"4351212002","github_run_number":"34","github_sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4"}},"metadata":{"buildInvocationID":"4351212002-1","completeness":{"parameters":true,"environment":false,"materials":false},"reproducible":false},"materials":[{"uri":"git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5","digest":{"sha1":"24acc49548454b2f21a01a85d3357fc1858abdf4"}}]}}
Index: 14844786
IntegratedTime: 2023-03-07T06:15:00Z
UUID: 24296fb24b8ad77a3c4acd8f2f5e8f656c9743bd79f682cc16e6927ff202acaa9c77d7908e07a076
Body: {
  "IntotoObj": {
    "content": {
      "hash": {
        "algorithm": "sha256",
        "value": "11868585ee1ee3b51f2a519a25e2941c1990e59fc101e3b4b8855edd7396c9f5"
      },
      "payloadHash": {
        "algorithm": "sha256",
        "value": "441c6f8888456305c8468699c9a6f37274a97a1ca31718ca151273789165c5a2"
      }
    },
    "publicKey": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUR6akNDQTFTZ0F3SUJBZ0lVU2dYempPMVdUdVMxeUxmdktWQ2NmNDQvS3prd0NnWUlLb1pJemowRUF3TXcKTnpFVk1CTUdBMVVFQ2hNTWMybG5jM1J2Y21VdVpHVjJNUjR3SEFZRFZRUURFeFZ6YVdkemRHOXlaUzFwYm5SbApjbTFsWkdsaGRHVXdIaGNOTWpNd016QTNNRFl4TkRVNVdoY05Nak13TXpBM01EWXlORFU1V2pBQU1Ga3dFd1lICktvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUVncVladFRUM250d0ZGVGRRNGIrdC9mVXIwU0s5NjFiZE9VeXgKYTVGTVpYVDBqcCtTWGEzYUFCSjNlZy9vcWlYbmc4QmFlQ3RGczhMTFJiYjJTOURPUjZPQ0FuTXdnZ0p2TUE0RwpBMVVkRHdFQi93UUVBd0lIZ0RBVEJnTlZIU1VFRERBS0JnZ3JCZ0VGQlFjREF6QWRCZ05WSFE0RUZnUVVkYjduCm1UK05qMWZNZzE2ck1id002SW9yR1A0d0h3WURWUjBqQkJnd0ZvQVUzOVBwejFZa0VaYjVxTmpwS0ZXaXhpNFkKWkQ4d2dZZ0dBMVVkRVFFQi93UitNSHlHZW1oMGRIQnpPaTh2WjJsMGFIVmlMbU52YlM5NmJHRmlhbkF2YzJ4egpZUzFuYVhSb2RXSXRaMlZ1WlhKaGRHOXlMeTVuYVhSb2RXSXZkMjl5YTJac2IzZHpMMmRsYm1WeVlYUnZjbDlqCmIyNTBZV2x1WlhKZmMyeHpZVE11ZVcxc1FISmxabk12YUdWaFpITXZabWw0TFdOdmMybG5iaTFtYkdGbk1Ea0cKQ2lzR0FRUUJnNzh3QVFFRUsyaDBkSEJ6T2k4dmRHOXJaVzR1WVdOMGFXOXVjeTVuYVhSb2RXSjFjMlZ5WTI5dQpkR1Z1ZEM1amIyMHdFZ1lLS3dZQkJBR0R2ekFCQWdRRWNIVnphREEyQmdvckJnRUVBWU8vTUFFREJDZ3lOR0ZqCll6UTVOVFE0TkRVMFlqSm1NakZoTURGaE9EVmtNek0xTjJaak1UZzFPR0ZpWkdZME1CNEdDaXNHQVFRQmc3OHcKQVFRRUVGTk1VMEVnWjI4Z2NtVnNaV0Z6WlhJd0tRWUtLd1lCQkFHRHZ6QUJCUVFiZW14aFltcHdMM05zYzJFdApjSEp2ZG1WdVlXNWpaUzEwWlhOME1CNEdDaXNHQVFRQmc3OHdBUVlFRUhKbFpuTXZkR0ZuY3k5Mk1DNHdMalV3CmdZb0dDaXNHQVFRQjFua0NCQUlFZkFSNkFIZ0FkZ0RkUFRCcXhzY1JNbU1aSGh5Wlp6Y0Nva3BldU40OHJmK0gKaW5LQUx5bnVqZ0FBQVlhNnRYTnFBQUFFQXdCSE1FVUNJUUQyTVgyMEQ1T0RGbGJsSnRkS0Y5MzVkOWRCQTFPawpxN0x1NFR6Y3lBb3pIQUlnU0FUZHFBZnJiRzAxMkFGNWdKWUxFbVlRWjBiL1h5MDIweWpZMks1c0M2NHdDZ1lJCktvWkl6ajBFQXdNRGFBQXdaUUl3Tm9IbmIxdit4eGhQc050MVRzN3dNN3BPb1ZKeGVYRnlrZk9kQTc0cEdXNHkKUVQxSDBGODREVUV2WTF0K3BNNHZBakVBdHcyK2dXRHlMVWd2UDhDMGpHZ1ZEb1RpR3ZsYUgwMDk5clR6a0NwcwoxWndiS3VZMVRtNUlYQkluMzhkUk10T0EKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
  }
}
```

### Verify

```
$ slsa-verifier verify-image ghcr.io/zlabjp/slsa-provenance-test@sha256:18d935906bbac62909c4a301616046a373f1f4ce714cdddf452a2381354034c0 \
                --source-uri github.com/zlabjp/slsa-provenance-test \
                --source-tag v0.0.5
```

or

FIXME: certificate-identity
```
$ cosign verify-attestation \
         --certificate-identity-regexp="https://github.com/zlabjp/slsa-github-generator/.*" \
         --certificate-oidc-issuer=https://token.actions.githubusercontent.com
         ghcr.io/zlabjp/slsa-provenance-test:v0.0.5 
```

### Show provenance

```
> docker buildx imagetools inspect ghcr.io/zlabjp/slsa-provenance-test:v0.0.5 --format "{{ json .Provenance.SLSA }}"
```
<details>
<summary>output</summary>

```json
{
  "buildConfig": {
    "digestMapping": {
      "sha256:2c55385cff27f03725baa576f152fed01724374a0a78e865616b1f23b29009a4": "step1",
      "sha256:459a7ce65cf2cbf67af7b756e81f4baf06b3bbb597110df31c89a4c59165c1c5": "step0",
      "sha256:8762169e75acc64712d28ed2d2557b1b86e0d1ee408b3fed64cd201e2c74e383": "step6",
      "sha256:8824e9b3a491d8366e62a6c40cd2faf2a674dd75654d2c2011b2f4ebcae82696": "step2",
      "sha256:9c2983bee7ccc9a7a78e68023862d96441c6ad232f234d49167edfeb861e04cc": "step3",
      "sha256:a4c7ff10faf34e69e519045fa9cec8677ae4fe7bf04a341d818568704c5f317a": "step5",
      "sha256:c0550c726d1950c5e93f6f808aff011ebbf177177b23e7810bb77ecb1806b3be": "step4"
    },
    "llbDefinition": [
      {
        "id": "step0",
        "op": {
          "Op": {
            "source": {
              "identifier": "docker-image://gcr.io/distroless/static@sha256:3c5767883bc3ad6c4ad7caf97f313e482f500f2c214f78e452ac1ca932e1bf7f"
            }
          },
          "constraints": {},
          "platform": {
            "Architecture": "amd64",
            "OS": "linux"
          }
        }
      },
      {
        "id": "step1",
        "op": {
          "Op": {
            "source": {
              "identifier": "docker-image://docker.io/library/ubuntu@sha256:b2175cd4cfdd5cdb1740b0e6ec6bbb4ea4892801c0ad5101a81f694152b6c559"
            }
          },
          "constraints": {},
          "platform": {
            "Architecture": "amd64",
            "OS": "linux"
          }
        }
      },
      {
        "id": "step2",
        "op": {
          "Op": {
            "source": {
              "attrs": {
                "local.followpaths": "[\"binary-linux-amd64/binary-linux-amd64\"]",
                "local.sharedkeyhint": "context"
              },
              "identifier": "local://context"
            }
          },
          "constraints": {}
        }
      },
      {
        "id": "step3",
        "inputs": [
          "step1:0",
          "step2:0"
        ],
        "op": {
          "Op": {
            "file": {
              "actions": [
                {
                  "Action": {
                    "copy": {
                      "allowEmptyWildcard": true,
                      "allowWildcard": true,
                      "attemptUnpackDockerCompatibility": true,
                      "createDestPath": true,
                      "dest": "/app",
                      "dirCopyContents": true,
                      "followSymlink": true,
                      "mode": -1,
                      "src": "/binary-linux-amd64/binary-linux-amd64",
                      "timestamp": -1
                    }
                  },
                  "input": 0,
                  "output": 0,
                  "secondaryInput": 1
                }
              ]
            }
          },
          "constraints": {},
          "platform": {
            "Architecture": "amd64",
            "OS": "linux"
          }
        }
      },
      {
        "id": "step4",
        "inputs": [
          "step3:0"
        ],
        "op": {
          "Op": {
            "exec": {
              "meta": {
                "args": [
                  "/bin/sh",
                  "-c",
                  "chmod 755 /app"
                ],
                "cwd": "/",
                "env": [
                  "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
                ],
                "removeMountStubsRecursive": true
              },
              "mounts": [
                {
                  "dest": "/",
                  "input": 0,
                  "output": 0
                }
              ]
            }
          },
          "constraints": {},
          "platform": {
            "Architecture": "amd64",
            "OS": "linux"
          }
        }
      },
      {
        "id": "step5",
        "inputs": [
          "step0:0",
          "step4:0"
        ],
        "op": {
          "Op": {
            "file": {
              "actions": [
                {
                  "Action": {
                    "copy": {
                      "allowEmptyWildcard": true,
                      "allowWildcard": true,
                      "createDestPath": true,
                      "dest": "/app",
                      "dirCopyContents": true,
                      "followSymlink": true,
                      "mode": -1,
                      "src": "/app",
                      "timestamp": -1
                    }
                  },
                  "input": 0,
                  "output": 0,
                  "secondaryInput": 1
                }
              ]
            }
          },
          "constraints": {},
          "platform": {
            "Architecture": "amd64",
            "OS": "linux"
          }
        }
      },
      {
        "id": "step6",
        "inputs": [
          "step5:0"
        ],
        "op": {
          "Op": null
        }
      }
    ]
  },
  "buildType": "https://mobyproject.org/buildkit@v1",
  "builder": {
    "id": "https://github.com/zlabjp/slsa-provenance-test/actions/runs/4351212002"
  },
  "invocation": {
    "configSource": {
      "entryPoint": "Dockerfile"
    },
    "environment": {
      "platform": "linux/amd64"
    },
    "parameters": {
      "args": {
        "label:org.opencontainers.image.created": "2023-03-07T06:13:07.859Z",
        "label:org.opencontainers.image.description": "",
        "label:org.opencontainers.image.licenses": "",
        "label:org.opencontainers.image.revision": "24acc49548454b2f21a01a85d3357fc1858abdf4",
        "label:org.opencontainers.image.source": "https://github.com/zlabjp/slsa-provenance-test",
        "label:org.opencontainers.image.title": "slsa-provenance-test",
        "label:org.opencontainers.image.url": "https://github.com/zlabjp/slsa-provenance-test",
        "label:org.opencontainers.image.version": "v0.0.5"
      },
      "frontend": "dockerfile.v0",
      "locals": [
        {
          "name": "context"
        },
        {
          "name": "dockerfile"
        }
      ]
    }
  },
  "materials": [
    {
      "digest": {
        "sha256": "b2175cd4cfdd5cdb1740b0e6ec6bbb4ea4892801c0ad5101a81f694152b6c559"
      },
      "uri": "pkg:docker/ubuntu?digest=sha256:b2175cd4cfdd5cdb1740b0e6ec6bbb4ea4892801c0ad5101a81f694152b6c559\u0026platform=linux%2Famd64"
    },
    {
      "digest": {
        "sha256": "3c5767883bc3ad6c4ad7caf97f313e482f500f2c214f78e452ac1ca932e1bf7f"
      },
      "uri": "pkg:docker/gcr.io/distroless/static?digest=sha256:3c5767883bc3ad6c4ad7caf97f313e482f500f2c214f78e452ac1ca932e1bf7f\u0026platform=linux%2Famd64"
    }
  ],
  "metadata": {
    "buildFinishedOn": "2023-03-07T06:13:11.536355226Z",
    "buildInvocationID": "yape2zf8kh5omd5fte3ja6kas",
    "buildStartedOn": "2023-03-07T06:13:08.664000925Z",
    "completeness": {
      "environment": true,
      "materials": false,
      "parameters": true
    },
    "https://mobyproject.org/buildkit@v1#metadata": {
      "layers": {
        "step0:0": [
          [
            {
              "digest": "sha256:383e1c5dd0c1830143b1230e90292ebd4219911e0512b70d250c8907c4899110",
              "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
              "size": 820995
            }
          ],
          [
            {
              "digest": "sha256:383e1c5dd0c1830143b1230e90292ebd4219911e0512b70d250c8907c4899110",
              "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
              "size": 820995
            }
          ]
        ],
        "step1:0": [
          [
            {
              "digest": "sha256:76769433fd8a87dd77a6ce33db12156b1ea8dad3da3a95e7c9c36a47ec17b24c",
              "mediaType": "application/vnd.oci.image.layer.v1.tar+gzip",
              "size": 29533839
            }
          ],
          [
            {
              "digest": "sha256:76769433fd8a87dd77a6ce33db12156b1ea8dad3da3a95e7c9c36a47ec17b24c",
              "mediaType": "application/vnd.oci.image.layer.v1.tar+gzip",
              "size": 29533839
            }
          ]
        ],
        "step5:0": [
          [
            {
              "digest": "sha256:383e1c5dd0c1830143b1230e90292ebd4219911e0512b70d250c8907c4899110",
              "mediaType": "application/vnd.docker.image.rootfs.diff.tar.gzip",
              "size": 820995
            },
            {
              "digest": "sha256:8070b07ccc99ab19a2700cbc3ac95992f8ba7ccd50557f721fc30974f875398d",
              "mediaType": "application/vnd.oci.image.layer.v1.tar+gzip",
              "size": 1098241
            }
          ]
        ]
      },
      "source": {
        "infos": [
          {
            "data": "IyB1YnVudHU6MjIuMDQKRlJPTSB1YnVudHVAc2hhMjU2OmIyMTc1Y2Q0Y2ZkZDVjZGIxNzQwYjBlNmVjNmJiYjRlYTQ4OTI4MDFjMGFkNTEwMWE4MWY2OTQxNTJiNmM1NTkgYXMgYnVpbGRlcgoKQUREIGJpbmFyeS1saW51eC1hbWQ2NC9iaW5hcnktbGludXgtYW1kNjQgL2FwcAojIGh0dHBzOi8vZ2l0aHViLmNvbS9hY3Rpb25zL3VwbG9hZC1hcnRpZmFjdC9pc3N1ZXMvMzgKUlVOIGNobW9kIDc1NSAvYXBwCgpGUk9NIGdjci5pby9kaXN0cm9sZXNzL3N0YXRpY0BzaGEyNTY6M2M1NzY3ODgzYmMzYWQ2YzRhZDdjYWY5N2YzMTNlNDgyZjUwMGYyYzIxNGY3OGU0NTJhYzFjYTkzMmUxYmY3ZgoKQ09QWSAtLWZyb209YnVpbGRlciAvYXBwIC9hcHAKCkVOVFJZUE9JTlQgWyAiL2FwcCIgXQo=",
            "digestMapping": {
              "sha256:d5719d5c6ce52239c3966992e51cc5be350a522ba249ba2babf02eb009609f91": "step1",
              "sha256:ef79c9adcb6be52924bffecb0d35ec121024decfefa84bdb15532ec595b029f2": "step0"
            },
            "filename": "Dockerfile",
            "llbDefinition": [
              {
                "id": "step0",
                "op": {
                  "Op": {
                    "source": {
                      "attrs": {
                        "local.differ": "none",
                        "local.followpaths": "[\"Dockerfile\",\"Dockerfile.dockerignore\",\"dockerfile\"]",
                        "local.sharedkeyhint": "dockerfile"
                      },
                      "identifier": "local://dockerfile"
                    }
                  },
                  "constraints": {}
                }
              },
              {
                "id": "step1",
                "inputs": [
                  "step0:0"
                ],
                "op": {
                  "Op": null
                }
              }
            ]
          }
        ],
        "locations": {
          "step0": {
            "locations": [
              {
                "ranges": [
                  {
                    "end": {
                      "line": 8
                    },
                    "start": {
                      "line": 8
                    }
                  }
                ]
              }
            ]
          },
          "step1": {
            "locations": [
              {
                "ranges": [
                  {
                    "end": {
                      "line": 2
                    },
                    "start": {
                      "line": 2
                    }
                  }
                ]
              }
            ]
          },
          "step2": {},
          "step3": {
            "locations": [
              {
                "ranges": [
                  {
                    "end": {
                      "line": 4
                    },
                    "start": {
                      "line": 4
                    }
                  }
                ]
              }
            ]
          },
          "step4": {
            "locations": [
              {
                "ranges": [
                  {
                    "end": {
                      "line": 6
                    },
                    "start": {
                      "line": 6
                    }
                  }
                ]
              }
            ]
          },
          "step5": {
            "locations": [
              {
                "ranges": [
                  {
                    "end": {
                      "line": 10
                    },
                    "start": {
                      "line": 10
                    }
                  }
                ]
              }
            ]
          }
        }
      },
      "vcs": {
        "revision": "24acc49548454b2f21a01a85d3357fc1858abdf4-dirty",
        "source": "https://github.com/zlabjp/slsa-provenance-test"
      }
    },
    "reproducible": false
  }
}
```
</details>
