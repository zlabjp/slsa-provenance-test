# slsa-provenance-test

This is only used for testing [slsa-github-generator](https://github.com/slsa-framework/slsa-github-generator) and [slsa-verifier](https://github.com/slsa-framework/slsa-verifier).

The latest version of slsa-github-generator (`v1.5.0`) does not fully support private Sigstore tools (Rekor, Fulcio)
and this repo's software supply chain metadata is exposed to the public Rekor instance as transparency logs.

- [Artifacts](#artifacts)
    - [Binary files](#binary-files)
        - [Find transparency logs](#find-transparency-logs)
        - [Verify](#verify)
        - [Show provenance](#show-provenance)
    - [Container images](#container-images)
        - [Find transparency logs](#find-transparency-logs-1)
        - [Verify](#verify-1)
        - [Show provenance](#show-provenance-1)

## Artifacts

### Binary files

The Actions workflow uploads binary files and provenances to GitHub releases.

- `binary-linux-amd64`
- `binary-linux-amd64.intoto.jsonl`

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

#### Verify

```
$ slsa-verifier verify-artifact "binary-linux-amd64" \
                --provenance-path "binary-linux-amd64.intoto.jsonl" \
                --source-uri "github.com/zlabjp/slsa-provenance-test" \
                --source-tag "v0.0.5"   
```

or

```
$ cat binary-linux-amd64.intoto.jsonl | jq -r .signatures[0].cert | base64 -w0 > cert

$ cosign verify-blob-attestation binary-linux-amd64 \
         --signature binary-linux-amd64.intoto.jsonl \
         --certificate cert \
         --certificate-identity-regexp="https://github.com/slsa-framework/slsa-github-generator/.*" \
         --certificate-oidc-issuer=https://token.actions.githubusercontent.com \
         --type slsaprovenance
```

#### Show provenance

```
$ cat binary-linux-amd64.intoto.jsonl
```

```json
{
  "payloadType": "application/vnd.in-toto+json",
  "payload": "eyJfdHlwZSI6Imh0dHBzOi8vaW4tdG90by5pby9TdGF0ZW1lbnQvdjAuMSIsInByZWRpY2F0ZVR5cGUiOiJodHRwczovL3Nsc2EuZGV2L3Byb3ZlbmFuY2UvdjAuMiIsInN1YmplY3QiOlt7Im5hbWUiOiJiaW5hcnktbGludXgtYW1kNjQiLCJkaWdlc3QiOnsic2hhMjU2IjoiOWY3MDE0NjgyYjc4NDIxNjlmNzg5YjhjNzkwNDFkNzAzMTNkZTBhNTkyYTk0NDEzYTI0N2Y1YTYwNDcxNjdjZCJ9fV0sInByZWRpY2F0ZSI6eyJidWlsZGVyIjp7ImlkIjoiaHR0cHM6Ly9naXRodWIuY29tL3Nsc2EtZnJhbWV3b3JrL3Nsc2EtZ2l0aHViLWdlbmVyYXRvci8uZ2l0aHViL3dvcmtmbG93cy9idWlsZGVyX2dvX3Nsc2EzLnltbEByZWZzL3RhZ3MvdjEuNS4wIn0sImJ1aWxkVHlwZSI6Imh0dHBzOi8vZ2l0aHViLmNvbS9zbHNhLWZyYW1ld29yay9zbHNhLWdpdGh1Yi1nZW5lcmF0b3IvZ29AdjEiLCJpbnZvY2F0aW9uIjp7ImNvbmZpZ1NvdXJjZSI6eyJ1cmkiOiJnaXQraHR0cHM6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdEByZWZzL3RhZ3MvdjAuMC41IiwiZGlnZXN0Ijp7InNoYTEiOiIyNGFjYzQ5NTQ4NDU0YjJmMjFhMDFhODVkMzM1N2ZjMTg1OGFiZGY0In0sImVudHJ5UG9pbnQiOiIuZ2l0aHViL3dvcmtmbG93cy9zbHNhLXByb3ZlbmFuY2UueW1sIn0sInBhcmFtZXRlcnMiOnt9LCJlbnZpcm9ubWVudCI6eyJhcmNoIjoiWDY0IiwiZ2l0aHViX2FjdG9yIjoiaGl5b3NpIiwiZ2l0aHViX2FjdG9yX2lkIjoiOTQ4NzYwIiwiZ2l0aHViX2Jhc2VfcmVmIjoiIiwiZ2l0aHViX2V2ZW50X25hbWUiOiJwdXNoIiwiZ2l0aHViX2V2ZW50X3BheWxvYWQiOnsiYWZ0ZXIiOiIyNGFjYzQ5NTQ4NDU0YjJmMjFhMDFhODVkMzM1N2ZjMTg1OGFiZGY0IiwiYmFzZV9yZWYiOiJyZWZzL2hlYWRzL21haW4iLCJiZWZvcmUiOiIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIiwiY29tbWl0cyI6W10sImNvbXBhcmUiOiJodHRwczovL2dpdGh1Yi5jb20vemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbXBhcmUvdjAuMC41IiwiY3JlYXRlZCI6dHJ1ZSwiZGVsZXRlZCI6ZmFsc2UsImZvcmNlZCI6ZmFsc2UsImhlYWRfY29tbWl0Ijp7ImF1dGhvciI6eyJlbWFpbCI6Ijk0ODc2MCt0b3VzYW1pQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbSIsIm5hbWUiOiJUb21veWEgVXNhbWkiLCJ1c2VybmFtZSI6ImhpeW9zaSJ9LCJjb21taXR0ZXIiOnsiZW1haWwiOiI5NDg3NjArdG91c2FtaUB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20iLCJuYW1lIjoiVG9tb3lhIFVzYW1pIiwidXNlcm5hbWUiOiJoaXlvc2kifSwiZGlzdGluY3QiOnRydWUsImlkIjoiMjRhY2M0OTU0ODQ1NGIyZjIxYTAxYTg1ZDMzNTdmYzE4NThhYmRmNCIsIm1lc3NhZ2UiOiJGaXggd29ya2Zsb3ciLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTA3VDE1OjA1OjA1KzA5OjAwIiwidHJlZV9pZCI6IjAxYWQ5ZjczN2RjZTU5MzM0NjJiODM4OTQyNmIzMDIzMTgwMGU4MzYiLCJ1cmwiOiJodHRwczovL2dpdGh1Yi5jb20vemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbW1pdC8yNGFjYzQ5NTQ4NDU0YjJmMjFhMDFhODVkMzM1N2ZjMTg1OGFiZGY0In0sIm9yZ2FuaXphdGlvbiI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2MDQzODA4P3Y9NCIsImRlc2NyaXB0aW9uIjoiIiwiZXZlbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvZXZlbnRzIiwiaG9va3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9vcmdzL3psYWJqcC9ob29rcyIsImlkIjoxNjA0MzgwOCwiaXNzdWVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvaXNzdWVzIiwibG9naW4iOiJ6bGFianAiLCJtZW1iZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvbWVtYmVyc3svbWVtYmVyfSIsIm5vZGVfaWQiOiJNREV5T2s5eVoyRnVhWHBoZEdsdmJqRTJNRFF6T0RBNCIsInB1YmxpY19tZW1iZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvcHVibGljX21lbWJlcnN7L21lbWJlcn0iLCJyZXBvc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL29yZ3MvemxhYmpwL3JlcG9zIiwidXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9vcmdzL3psYWJqcCJ9LCJwdXNoZXIiOnsiZW1haWwiOiI5NDg3NjAraGl5b3NpQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbSIsIm5hbWUiOiJoaXlvc2kifSwicmVmIjoicmVmcy90YWdzL3YwLjAuNSIsInJlcG9zaXRvcnkiOnsiYWxsb3dfZm9ya2luZyI6dHJ1ZSwiYXJjaGl2ZV91cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC97YXJjaGl2ZV9mb3JtYXR9ey9yZWZ9IiwiYXJjaGl2ZWQiOmZhbHNlLCJhc3NpZ25lZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvYXNzaWduZWVzey91c2VyfSIsImJsb2JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC9ibG9ic3svc2hhfSIsImJyYW5jaGVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2JyYW5jaGVzey9icmFuY2h9IiwiY2xvbmVfdXJsIjoiaHR0cHM6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC5naXQiLCJjb2xsYWJvcmF0b3JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbGxhYm9yYXRvcnN7L2NvbGxhYm9yYXRvcn0iLCJjb21tZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9jb21tZW50c3svbnVtYmVyfSIsImNvbW1pdHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvY29tbWl0c3svc2hhfSIsImNvbXBhcmVfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvY29tcGFyZS97YmFzZX0uLi57aGVhZH0iLCJjb250ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9jb250ZW50cy97K3BhdGh9IiwiY29udHJpYnV0b3JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbnRyaWJ1dG9ycyIsImNyZWF0ZWRfYXQiOjE2NzgwNjEwMjgsImRlZmF1bHRfYnJhbmNoIjoibWFpbiIsImRlcGxveW1lbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2RlcGxveW1lbnRzIiwiZGVzY3JpcHRpb24iOm51bGwsImRpc2FibGVkIjpmYWxzZSwiZG93bmxvYWRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2Rvd25sb2FkcyIsImV2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9ldmVudHMiLCJmb3JrIjpmYWxzZSwiZm9ya3MiOjAsImZvcmtzX2NvdW50IjowLCJmb3Jrc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9mb3JrcyIsImZ1bGxfbmFtZSI6InpsYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdCIsImdpdF9jb21taXRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC9jb21taXRzey9zaGF9IiwiZ2l0X3JlZnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvZ2l0L3JlZnN7L3NoYX0iLCJnaXRfdGFnc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9naXQvdGFnc3svc2hhfSIsImdpdF91cmwiOiJnaXQ6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC5naXQiLCJoYXNfZGlzY3Vzc2lvbnMiOmZhbHNlLCJoYXNfZG93bmxvYWRzIjp0cnVlLCJoYXNfaXNzdWVzIjp0cnVlLCJoYXNfcGFnZXMiOmZhbHNlLCJoYXNfcHJvamVjdHMiOnRydWUsImhhc193aWtpIjp0cnVlLCJob21lcGFnZSI6bnVsbCwiaG9va3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaG9va3MiLCJodG1sX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJpZCI6NjEwMDM0NzQ1LCJpc190ZW1wbGF0ZSI6ZmFsc2UsImlzc3VlX2NvbW1lbnRfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaXNzdWVzL2NvbW1lbnRzey9udW1iZXJ9IiwiaXNzdWVfZXZlbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2lzc3Vlcy9ldmVudHN7L251bWJlcn0iLCJpc3N1ZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaXNzdWVzey9udW1iZXJ9Iiwia2V5c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9rZXlzey9rZXlfaWR9IiwibGFiZWxzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2xhYmVsc3svbmFtZX0iLCJsYW5ndWFnZSI6IkRvY2tlcmZpbGUiLCJsYW5ndWFnZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvbGFuZ3VhZ2VzIiwibGljZW5zZSI6bnVsbCwibWFzdGVyX2JyYW5jaCI6Im1haW4iLCJtZXJnZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvbWVyZ2VzIiwibWlsZXN0b25lc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9taWxlc3RvbmVzey9udW1iZXJ9IiwibWlycm9yX3VybCI6bnVsbCwibmFtZSI6InNsc2EtcHJvdmVuYW5jZS10ZXN0Iiwibm9kZV9pZCI6IlJfa2dET0pGeGtPUSIsIm5vdGlmaWNhdGlvbnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvbm90aWZpY2F0aW9uc3s/c2luY2UsYWxsLHBhcnRpY2lwYXRpbmd9Iiwib3Blbl9pc3N1ZXMiOjAsIm9wZW5faXNzdWVzX2NvdW50IjowLCJvcmdhbml6YXRpb24iOiJ6bGFianAiLCJvd25lciI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2MDQzODA4P3Y9NCIsImVtYWlsIjpudWxsLCJldmVudHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvZXZlbnRzey9wcml2YWN5fSIsImZvbGxvd2Vyc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9mb2xsb3dlcnMiLCJmb2xsb3dpbmdfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvZm9sbG93aW5ney9vdGhlcl91c2VyfSIsImdpc3RzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwL2dpc3Rzey9naXN0X2lkfSIsImdyYXZhdGFyX2lkIjoiIiwiaHRtbF91cmwiOiJodHRwczovL2dpdGh1Yi5jb20vemxhYmpwIiwiaWQiOjE2MDQzODA4LCJsb2dpbiI6InpsYWJqcCIsIm5hbWUiOiJ6bGFianAiLCJub2RlX2lkIjoiTURFeU9rOXlaMkZ1YVhwaGRHbHZiakUyTURRek9EQTQiLCJvcmdhbml6YXRpb25zX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwL29yZ3MiLCJyZWNlaXZlZF9ldmVudHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvcmVjZWl2ZWRfZXZlbnRzIiwicmVwb3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvcmVwb3MiLCJzaXRlX2FkbWluIjpmYWxzZSwic3RhcnJlZF91cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9zdGFycmVkey9vd25lcn17L3JlcG99Iiwic3Vic2NyaXB0aW9uc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9zdWJzY3JpcHRpb25zIiwidHlwZSI6Ik9yZ2FuaXphdGlvbiIsInVybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwIn0sInByaXZhdGUiOmZhbHNlLCJwdWxsc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9wdWxsc3svbnVtYmVyfSIsInB1c2hlZF9hdCI6MTY3ODE2OTM1NiwicmVsZWFzZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvcmVsZWFzZXN7L2lkfSIsInNpemUiOjIzLCJzc2hfdXJsIjoiZ2l0QGdpdGh1Yi5jb206emxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0LmdpdCIsInN0YXJnYXplcnMiOjAsInN0YXJnYXplcnNfY291bnQiOjAsInN0YXJnYXplcnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3RhcmdhemVycyIsInN0YXR1c2VzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L3N0YXR1c2VzL3tzaGF9Iiwic3Vic2NyaWJlcnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3Vic2NyaWJlcnMiLCJzdWJzY3JpcHRpb25fdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3Vic2NyaXB0aW9uIiwic3ZuX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJ0YWdzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L3RhZ3MiLCJ0ZWFtc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC90ZWFtcyIsInRvcGljcyI6W10sInRyZWVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC90cmVlc3svc2hhfSIsInVwZGF0ZWRfYXQiOiIyMDIzLTAzLTA3VDAyOjAzOjMwWiIsInVybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJ2aXNpYmlsaXR5IjoicHVibGljIiwid2F0Y2hlcnMiOjAsIndhdGNoZXJzX2NvdW50IjowLCJ3ZWJfY29tbWl0X3NpZ25vZmZfcmVxdWlyZWQiOmZhbHNlfSwic2VuZGVyIjp7ImF2YXRhcl91cmwiOiJodHRwczovL2F2YXRhcnMuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3UvOTQ4NzYwP3Y9NCIsImV2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9ldmVudHN7L3ByaXZhY3l9IiwiZm9sbG93ZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL2ZvbGxvd2VycyIsImZvbGxvd2luZ191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IiwiZ2lzdHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9oaXlvc2kvZ2lzdHN7L2dpc3RfaWR9IiwiZ3JhdmF0YXJfaWQiOiIiLCJodG1sX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS9oaXlvc2kiLCJpZCI6OTQ4NzYwLCJsb2dpbiI6ImhpeW9zaSIsIm5vZGVfaWQiOiJNRFE2VlhObGNqazBPRGMyTUE9PSIsIm9yZ2FuaXphdGlvbnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9oaXlvc2kvb3JncyIsInJlY2VpdmVkX2V2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9yZWNlaXZlZF9ldmVudHMiLCJyZXBvc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9yZXBvcyIsInNpdGVfYWRtaW4iOmZhbHNlLCJzdGFycmVkX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL3N0YXJyZWR7L293bmVyfXsvcmVwb30iLCJzdWJzY3JpcHRpb25zX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL3N1YnNjcmlwdGlvbnMiLCJ0eXBlIjoiVXNlciIsInVybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpIn19LCJnaXRodWJfaGVhZF9yZWYiOiIiLCJnaXRodWJfcmVmIjoicmVmcy90YWdzL3YwLjAuNSIsImdpdGh1Yl9yZWZfdHlwZSI6InRhZyIsImdpdGh1Yl9yZXBvc2l0b3J5X2lkIjoiNjEwMDM0NzQ1IiwiZ2l0aHViX3JlcG9zaXRvcnlfb3duZXIiOiJ6bGFianAiLCJnaXRodWJfcmVwb3NpdG9yeV9vd25lcl9pZCI6IjE2MDQzODA4IiwiZ2l0aHViX3J1bl9hdHRlbXB0IjoiMSIsImdpdGh1Yl9ydW5faWQiOiI0MzUxMjEyMDAyIiwiZ2l0aHViX3J1bl9udW1iZXIiOiIzNCIsImdpdGh1Yl9zaGExIjoiMjRhY2M0OTU0ODQ1NGIyZjIxYTAxYTg1ZDMzNTdmYzE4NThhYmRmNCIsIm9zIjoidWJ1bnR1MjIifX0sImJ1aWxkQ29uZmlnIjp7InN0ZXBzIjpbeyJ3b3JraW5nRGlyIjoiL2hvbWUvcnVubmVyL3dvcmsvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc2xzYS1wcm92ZW5hbmNlLXRlc3QvX19QUk9KRUNUX0NIRUNLT1VUX0RJUl9fIiwiY29tbWFuZCI6WyIvb3B0L2hvc3RlZHRvb2xjYWNoZS9nby8xLjE5LjYveDY0L2Jpbi9nbyIsIm1vZCIsInZlbmRvciJdLCJlbnYiOm51bGx9LHsid29ya2luZ0RpciI6Ii9ob21lL3J1bm5lci93b3JrL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L3Nsc2EtcHJvdmVuYW5jZS10ZXN0L19fUFJPSkVDVF9DSEVDS09VVF9ESVJfXyIsImNvbW1hbmQiOlsiL29wdC9ob3N0ZWR0b29sY2FjaGUvZ28vMS4xOS42L3g2NC9iaW4vZ28iLCJidWlsZCIsIi1tb2Q9dmVuZG9yIiwiLXRyaW1wYXRoIiwiLXRhZ3M9bmV0Z28iLCItbGRmbGFncz0tWCBtYWluLlZlcnNpb249MC4wLjUiLCItbyIsImJpbmFyeS1saW51eC1hbWQ2NCIsIm1haW4uZ28iXSwiZW52IjpbIkdPT1M9bGludXgiLCJHT0FSQ0g9YW1kNjQiLCJDR09fRU5BQkxFRD0wIl19XSwidmVyc2lvbiI6MX0sIm1ldGFkYXRhIjp7ImJ1aWxkSW52b2NhdGlvbklEIjoiNDM1MTIxMjAwMi0xIiwiY29tcGxldGVuZXNzIjp7InBhcmFtZXRlcnMiOnRydWUsImVudmlyb25tZW50IjpmYWxzZSwibWF0ZXJpYWxzIjpmYWxzZX0sInJlcHJvZHVjaWJsZSI6ZmFsc2V9LCJtYXRlcmlhbHMiOlt7InVyaSI6ImdpdCtodHRwczovL2dpdGh1Yi5jb20vemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0QHJlZnMvdGFncy92MC4wLjUiLCJkaWdlc3QiOnsic2hhMSI6IjI0YWNjNDk1NDg0NTRiMmYyMWEwMWE4NWQzMzU3ZmMxODU4YWJkZjQifX0seyJ1cmkiOiJodHRwczovL2dpdGh1Yi5jb20vYWN0aW9ucy92aXJ0dWFsLWVudmlyb25tZW50cy9yZWxlYXNlcy90YWcvdWJ1bnR1MjIvMjAyMzAyMjcuMiJ9XX19",
  "signatures": [
    {
      "keyid": "",
      "sig": "MEQCICOw5LWBr9Qfu7gxIMUrdxp+7UEikj6SVldRUq01+KDXAiB05WOS0EXaO+A3qBN6U3ryv6maYDq17I3s2IdqSug8Bw==",
      "cert": "-----BEGIN CERTIFICATE-----\nMIIDwjCCA0mgAwIBAgIUOpkQanbcpqOGmla8V/AWSkbMzTgwCgYIKoZIzj0EAwMw\nNzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl\ncm1lZGlhdGUwHhcNMjMwMzA3MDYxMjAwWhcNMjMwMzA3MDYyMjAwWjAAMFkwEwYH\nKoZIzj0CAQYIKoZIzj0DAQcDQgAEt0ymGGmerg46oSjnO2nPGRcAwfaYANtraMM0\nWV5Le47BcH9sXLA40pb7XWWMaMyfEUJls48kGws4RBC0KGKuMKOCAmgwggJkMA4G\nA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUQ7ll\nEilbys9BvYjvcmqDePkKzWswHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y\nZD8wfQYDVR0RAQH/BHMwcYZvaHR0cHM6Ly9naXRodWIuY29tL3Nsc2EtZnJhbWV3\nb3JrL3Nsc2EtZ2l0aHViLWdlbmVyYXRvci8uZ2l0aHViL3dvcmtmbG93cy9idWls\nZGVyX2dvX3Nsc2EzLnltbEByZWZzL3RhZ3MvdjEuNS4wMDkGCisGAQQBg78wAQEE\nK2h0dHBzOi8vdG9rZW4uYWN0aW9ucy5naXRodWJ1c2VyY29udGVudC5jb20wEgYK\nKwYBBAGDvzABAgQEcHVzaDA2BgorBgEEAYO/MAEDBCgyNGFjYzQ5NTQ4NDU0YjJm\nMjFhMDFhODVkMzM1N2ZjMTg1OGFiZGY0MB4GCisGAQQBg78wAQQEEFNMU0EgZ28g\ncmVsZWFzZXIwKQYKKwYBBAGDvzABBQQbemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10\nZXN0MB4GCisGAQQBg78wAQYEEHJlZnMvdGFncy92MC4wLjUwgYsGCisGAQQB1nkC\nBAIEfQR7AHkAdwDdPTBqxscRMmMZHhyZZzcCokpeuN48rf+HinKALynujgAAAYa6\nsrlwAAAEAwBIMEYCIQC1rALC32p2VhDIZ3QJOKwsqgkgx9k7GPgDwCUYaylrEwIh\nANgnzISmymdhZrkp3Vj+X/3/L8O6rG3Wy9I+/KpgIJOiMAoGCCqGSM49BAMDA2cA\nMGQCMGG/OnsahTAHW8kU6LXCqlT+E/5T6tX2FcGDTbqpKtlYZi63GVd+mq8hbHoe\ntHexrwIwXTIjR7t6Y0qZVvgvmxrrvym6epRp9nqO+EHhXnAxut3cD1dfcCiq+PMZ\nK1MS8FJJ\n-----END CERTIFICATE-----\n"
    }
  ]
}
```

```
$ cat binary-linux-amd64.intoto.jsonl | jq -r  .payload | base64 -d | jq .
```

<details>
<summary>output</summary>

```json
{
  "_type": "https://in-toto.io/Statement/v0.1",
  "predicateType": "https://slsa.dev/provenance/v0.2",
  "subject": [
    {
      "name": "binary-linux-amd64",
      "digest": {
        "sha256": "9f7014682b7842169f789b8c79041d70313de0a592a94413a247f5a6047167cd"
      }
    }
  ],
  "predicate": {
    "builder": {
      "id": "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/builder_go_slsa3.yml@refs/tags/v1.5.0"
    },
    "buildType": "https://github.com/slsa-framework/slsa-github-generator/go@v1",
    "invocation": {
      "configSource": {
        "uri": "git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5",
        "digest": {
          "sha1": "24acc49548454b2f21a01a85d3357fc1858abdf4"
        },
        "entryPoint": ".github/workflows/slsa-provenance.yml"
      },
      "parameters": {},
      "environment": {
        "arch": "X64",
        "github_actor": "hiyosi",
        "github_actor_id": "948760",
        "github_base_ref": "",
        "github_event_name": "push",
        "github_event_payload": {
          "after": "24acc49548454b2f21a01a85d3357fc1858abdf4",
          "base_ref": "refs/heads/main",
          "before": "0000000000000000000000000000000000000000",
          "commits": [],
          "compare": "https://github.com/zlabjp/slsa-provenance-test/compare/v0.0.5",
          "created": true,
          "deleted": false,
          "forced": false,
          "head_commit": {
            "author": {
              "email": "948760+tousami@users.noreply.github.com",
              "name": "Tomoya Usami",
              "username": "hiyosi"
            },
            "committer": {
              "email": "948760+tousami@users.noreply.github.com",
              "name": "Tomoya Usami",
              "username": "hiyosi"
            },
            "distinct": true,
            "id": "24acc49548454b2f21a01a85d3357fc1858abdf4",
            "message": "Fix workflow",
            "timestamp": "2023-03-07T15:05:05+09:00",
            "tree_id": "01ad9f737dce5933462b8389426b30231800e836",
            "url": "https://github.com/zlabjp/slsa-provenance-test/commit/24acc49548454b2f21a01a85d3357fc1858abdf4"
          },
          "organization": {
            "avatar_url": "https://avatars.githubusercontent.com/u/16043808?v=4",
            "description": "",
            "events_url": "https://api.github.com/orgs/zlabjp/events",
            "hooks_url": "https://api.github.com/orgs/zlabjp/hooks",
            "id": 16043808,
            "issues_url": "https://api.github.com/orgs/zlabjp/issues",
            "login": "zlabjp",
            "members_url": "https://api.github.com/orgs/zlabjp/members{/member}",
            "node_id": "MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4",
            "public_members_url": "https://api.github.com/orgs/zlabjp/public_members{/member}",
            "repos_url": "https://api.github.com/orgs/zlabjp/repos",
            "url": "https://api.github.com/orgs/zlabjp"
          },
          "pusher": {
            "email": "948760+hiyosi@users.noreply.github.com",
            "name": "hiyosi"
          },
          "ref": "refs/tags/v0.0.5",
          "repository": {
            "allow_forking": true,
            "archive_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/{archive_format}{/ref}",
            "archived": false,
            "assignees_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/assignees{/user}",
            "blobs_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/blobs{/sha}",
            "branches_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/branches{/branch}",
            "clone_url": "https://github.com/zlabjp/slsa-provenance-test.git",
            "collaborators_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/collaborators{/collaborator}",
            "comments_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/comments{/number}",
            "commits_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/commits{/sha}",
            "compare_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/compare/{base}...{head}",
            "contents_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/contents/{+path}",
            "contributors_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/contributors",
            "created_at": 1678061028,
            "default_branch": "main",
            "deployments_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/deployments",
            "description": null,
            "disabled": false,
            "downloads_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/downloads",
            "events_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/events",
            "fork": false,
            "forks": 0,
            "forks_count": 0,
            "forks_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/forks",
            "full_name": "zlabjp/slsa-provenance-test",
            "git_commits_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/commits{/sha}",
            "git_refs_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/refs{/sha}",
            "git_tags_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/tags{/sha}",
            "git_url": "git://github.com/zlabjp/slsa-provenance-test.git",
            "has_discussions": false,
            "has_downloads": true,
            "has_issues": true,
            "has_pages": false,
            "has_projects": true,
            "has_wiki": true,
            "homepage": null,
            "hooks_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/hooks",
            "html_url": "https://github.com/zlabjp/slsa-provenance-test",
            "id": 610034745,
            "is_template": false,
            "issue_comment_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/comments{/number}",
            "issue_events_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/events{/number}",
            "issues_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues{/number}",
            "keys_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/keys{/key_id}",
            "labels_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/labels{/name}",
            "language": "Dockerfile",
            "languages_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/languages",
            "license": null,
            "master_branch": "main",
            "merges_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/merges",
            "milestones_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/milestones{/number}",
            "mirror_url": null,
            "name": "slsa-provenance-test",
            "node_id": "R_kgDOJFxkOQ",
            "notifications_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/notifications{?since,all,participating}",
            "open_issues": 0,
            "open_issues_count": 0,
            "organization": "zlabjp",
            "owner": {
              "avatar_url": "https://avatars.githubusercontent.com/u/16043808?v=4",
              "email": null,
              "events_url": "https://api.github.com/users/zlabjp/events{/privacy}",
              "followers_url": "https://api.github.com/users/zlabjp/followers",
              "following_url": "https://api.github.com/users/zlabjp/following{/other_user}",
              "gists_url": "https://api.github.com/users/zlabjp/gists{/gist_id}",
              "gravatar_id": "",
              "html_url": "https://github.com/zlabjp",
              "id": 16043808,
              "login": "zlabjp",
              "name": "zlabjp",
              "node_id": "MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4",
              "organizations_url": "https://api.github.com/users/zlabjp/orgs",
              "received_events_url": "https://api.github.com/users/zlabjp/received_events",
              "repos_url": "https://api.github.com/users/zlabjp/repos",
              "site_admin": false,
              "starred_url": "https://api.github.com/users/zlabjp/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/zlabjp/subscriptions",
              "type": "Organization",
              "url": "https://api.github.com/users/zlabjp"
            },
            "private": false,
            "pulls_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/pulls{/number}",
            "pushed_at": 1678169356,
            "releases_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/releases{/id}",
            "size": 23,
            "ssh_url": "git@github.com:zlabjp/slsa-provenance-test.git",
            "stargazers": 0,
            "stargazers_count": 0,
            "stargazers_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/stargazers",
            "statuses_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/statuses/{sha}",
            "subscribers_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/subscribers",
            "subscription_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/subscription",
            "svn_url": "https://github.com/zlabjp/slsa-provenance-test",
            "tags_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/tags",
            "teams_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/teams",
            "topics": [],
            "trees_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/trees{/sha}",
            "updated_at": "2023-03-07T02:03:30Z",
            "url": "https://github.com/zlabjp/slsa-provenance-test",
            "visibility": "public",
            "watchers": 0,
            "watchers_count": 0,
            "web_commit_signoff_required": false
          },
          "sender": {
            "avatar_url": "https://avatars.githubusercontent.com/u/948760?v=4",
            "events_url": "https://api.github.com/users/hiyosi/events{/privacy}",
            "followers_url": "https://api.github.com/users/hiyosi/followers",
            "following_url": "https://api.github.com/users/hiyosi/following{/other_user}",
            "gists_url": "https://api.github.com/users/hiyosi/gists{/gist_id}",
            "gravatar_id": "",
            "html_url": "https://github.com/hiyosi",
            "id": 948760,
            "login": "hiyosi",
            "node_id": "MDQ6VXNlcjk0ODc2MA==",
            "organizations_url": "https://api.github.com/users/hiyosi/orgs",
            "received_events_url": "https://api.github.com/users/hiyosi/received_events",
            "repos_url": "https://api.github.com/users/hiyosi/repos",
            "site_admin": false,
            "starred_url": "https://api.github.com/users/hiyosi/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/hiyosi/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/hiyosi"
          }
        },
        "github_head_ref": "",
        "github_ref": "refs/tags/v0.0.5",
        "github_ref_type": "tag",
        "github_repository_id": "610034745",
        "github_repository_owner": "zlabjp",
        "github_repository_owner_id": "16043808",
        "github_run_attempt": "1",
        "github_run_id": "4351212002",
        "github_run_number": "34",
        "github_sha1": "24acc49548454b2f21a01a85d3357fc1858abdf4",
        "os": "ubuntu22"
      }
    },
    "buildConfig": {
      "steps": [
        {
          "workingDir": "/home/runner/work/slsa-provenance-test/slsa-provenance-test/__PROJECT_CHECKOUT_DIR__",
          "command": [
            "/opt/hostedtoolcache/go/1.19.6/x64/bin/go",
            "mod",
            "vendor"
          ],
          "env": null
        },
        {
          "workingDir": "/home/runner/work/slsa-provenance-test/slsa-provenance-test/__PROJECT_CHECKOUT_DIR__",
          "command": [
            "/opt/hostedtoolcache/go/1.19.6/x64/bin/go",
            "build",
            "-mod=vendor",
            "-trimpath",
            "-tags=netgo",
            "-ldflags=-X main.Version=0.0.5",
            "-o",
            "binary-linux-amd64",
            "main.go"
          ],
          "env": [
            "GOOS=linux",
            "GOARCH=amd64",
            "CGO_ENABLED=0"
          ]
        }
      ],
      "version": 1
    },
    "metadata": {
      "buildInvocationID": "4351212002-1",
      "completeness": {
        "parameters": true,
        "environment": false,
        "materials": false
      },
      "reproducible": false
    },
    "materials": [
      {
        "uri": "git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5",
        "digest": {
          "sha1": "24acc49548454b2f21a01a85d3357fc1858abdf4"
        }
      },
      {
        "uri": "https://github.com/actions/virtual-environments/releases/tag/ubuntu22/20230227.2"
      }
    ]
  }
}
```

</details>


### Container images

The Actions workflow pushes images and attestations to GitHub packages.

- `slsa-provenance-test:${image_diget}`
- `slsa-provenance-test:${image_diget}.att`

#### Find transparency logs

search entries by container's hash value
```
$ rekor-cli search --sha "3dbd76ff6dc789a8bfd7b3303b15dd6fbac052af442f830b2eb527ab26976cf3"
Found matching entries (listed by UUID):
24296fb24b8ad77adfc165e2090a060fe97162d5a5f08af3e3927d9365371f1869e3bf1d6a029262
```

```
$ rekor-cli get --uuid "24296fb24b8ad77a3c4acd8f2f5e8f656c9743bd79f682cc16e6927ff202acaa9c77d7908e07a076"
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

#### Verify

```
$ slsa-verifier verify-image ghcr.io/zlabjp/slsa-provenance-test@sha256:3dbd76ff6dc789a8bfd7b3303b15dd6fbac052af442f830b2eb527ab26976cf3 \
                --source-uri github.com/zlabjp/slsa-provenance-test \
                --source-tag v0.0.5
```

※ In v0.0.5, we reference `slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@main`, so the validation fails.
When a new version is released, we need to update refs with tag.

see: https://github.com/zlabjp/slsa-provenance-test/blob/v0.0.5/.github/workflows/slsa-provenance.yml#L125

or

```
$ cosign verify-attestation ghcr.io/zlabjp/slsa-provenance-test@sha256:3dbd76ff6dc789a8bfd7b3303b15dd6fbac052af442f830b2eb527ab26976cf3 \
         --certificate-identity-regexp="https://github.com/slsa-framework/slsa-github-generator/.*" \
         --certificate-oidc-issuer=https://token.actions.githubusercontent.com \
         --type slsaprovenance
```

#### Show provenance

```
$ docker buildx imagetools inspect ghcr.io/zlabjp/slsa-provenance-test:v0.0.5 --format "{{ json .Provenance.SLSA }}"
```

<details>
<summary>output</summary>

```json
{
  "buildConfig": {
    "digestMapping": {
      "sha256:12881d02a5cc1da691a71eb8e43c813fba507f2aac34b8bee526588b8fcdb996": "step2",
      "sha256:2c55385cff27f03725baa576f152fed01724374a0a78e865616b1f23b29009a4": "step1",
      "sha256:459a7ce65cf2cbf67af7b756e81f4baf06b3bbb597110df31c89a4c59165c1c5": "step0",
      "sha256:533745f58cc1e92c7c6fc3cc9d4a1cb1c6b71d2fdb66cab1d7d101d51d1685b9": "step6",
      "sha256:deead102486abd720f531915c994c9f4c1b0db740147116abb2f4806750fc3f5": "step5",
      "sha256:f082e96392f7d971523f41d258100a149aa47836b2378df6ee89a562c73d7689": "step4",
      "sha256:f5633ddf1bc983267f94b8dc760597bb91fb76abf58ae7d7507addb753ad0ccf": "step3"
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
    "id": "https://github.com/zlabjp/slsa-provenance-test/actions/runs/4351897538"
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
        "label:org.opencontainers.image.created": "2023-03-07T08:04:37.152Z",
        "label:org.opencontainers.image.description": "",
        "label:org.opencontainers.image.licenses": "",
        "label:org.opencontainers.image.revision": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de",
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
    "buildFinishedOn": "2023-03-07T08:04:40.837845646Z",
    "buildInvocationID": "hgxc1q21vu053qmi8cf6w58cb",
    "buildStartedOn": "2023-03-07T08:04:37.968235247Z",
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
              "digest": "sha256:ca23dae0171c399ac2921170e24602172f2a0edc35ab43b7b62d5cd4acbc6339",
              "mediaType": "application/vnd.oci.image.layer.v1.tar+gzip",
              "size": 1098240
            }
          ]
        ]
      },
      "source": {
        "infos": [
          {
            "data": "IyB1YnVudHU6MjIuMDQKRlJPTSB1YnVudHVAc2hhMjU2OmIyMTc1Y2Q0Y2ZkZDVjZGIxNzQwYjBlNmVjNmJiYjRlYTQ4OTI4MDFjMGFkNTEwMWE4MWY2OTQxNTJiNmM1NTkgYXMgYnVpbGRlcgoKQUREIGJpbmFyeS1saW51eC1hbWQ2NC9iaW5hcnktbGludXgtYW1kNjQgL2FwcAojIGh0dHBzOi8vZ2l0aHViLmNvbS9hY3Rpb25zL3VwbG9hZC1hcnRpZmFjdC9pc3N1ZXMvMzgKUlVOIGNobW9kIDc1NSAvYXBwCgpGUk9NIGdjci5pby9kaXN0cm9sZXNzL3N0YXRpY0BzaGEyNTY6M2M1NzY3ODgzYmMzYWQ2YzRhZDdjYWY5N2YzMTNlNDgyZjUwMGYyYzIxNGY3OGU0NTJhYzFjYTkzMmUxYmY3ZgoKQ09QWSAtLWZyb209YnVpbGRlciAvYXBwIC9hcHAKCkVOVFJZUE9JTlQgWyAiL2FwcCIgXQo=",
            "digestMapping": {
              "sha256:9bf2b0e6ce0dc40907bd374f988d04c05d9c24df6beacad0a7c658e6cb4c4610": "step0",
              "sha256:d4392f480299c373a778443b4b31fb4fa8ad1dded52136eb5a84527d89bc97cb": "step1"
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
        "revision": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de-dirty",
        "source": "https://github.com/zlabjp/slsa-provenance-test"
      }
    },
    "reproducible": false
  }
}
```

</details>

```
$ crane manifest ghcr.io/zlabjp/slsa-provenance-test:sha256-3dbd76ff6dc789a8bfd7b3303b15dd6fbac052af442f830b2eb527ab26976cf3.att
```

```json
{
  "schemaVersion": 2,
  "mediaType": "application/vnd.oci.image.manifest.v1+json",
  "config": {
    "mediaType": "application/vnd.oci.image.config.v1+json",
    "size": 243,
    "digest": "sha256:f9a896778abeaac8cc3ba97d02612aacb9399585b8a7c430c073ef46ca0f2c36"
  },
  "layers": [
    {
      "mediaType": "application/vnd.dsse.envelope.v1+json",
      "size": 12420,
      "digest": "sha256:f8cf8a16b23744aa2ff562b4251c026f2218f9871b7b2834d39d8baba9778e4b",
      "annotations": {
        "dev.cosignproject.cosign/signature": "",
        "dev.sigstore.cosign/bundle": "{\"SignedEntryTimestamp\":\"MEUCIQCRljS6HyU+AYEaRlmX39uEwXmoD0XK1txEq9q9B/o4OAIgCWCYDKTKc+CFqmzQLYDXCda18xt/1lIPdckw/NNSDbo=\",\"Payload\":{\"body\":\"eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaW50b3RvIiwic3BlYyI6eyJjb250ZW50Ijp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmOGNmOGExNmIyMzc0NGFhMmZmNTYyYjQyNTFjMDI2ZjIyMThmOTg3MWI3YjI4MzRkMzlkOGJhYmE5Nzc4ZTRiIn0sInBheWxvYWRIYXNoIjp7ImFsZ29yaXRobSI6InNoYTI1NiIsInZhbHVlIjoiZjYyMzA0NzM0NTg3YmQ2MWEwZjQ2MmE0NTNiODZhZTBlNDhlMGZiNjFmODI4YmU3YTU1OTM0M2FiYjI2YWEzYiJ9fSwicHVibGljS2V5IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjVla05EUVRGSFowRjNTVUpCWjBsVlVUQnRTQ3RCTjB4M1RqUlhkRTgyUmxSTU9HUlJkbmgyY0RsTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcE5kMDE2UVROTlJHZDNUbXBKTlZkb1kwNU5hazEzVFhwQk0wMUVaM2hPYWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaYVZvME1URlRSazVMYkd4U1FVWnZMMHhNTjJab2JHZEJSMXBEZUU5dGMwOVhaQzhLTVdZclQweHpTM1pYYkV4VVJuVmFXbTFZTnpacllXTnFlRlUyYWtRNFpqWnFWa1pvY1hJeU9TOW9jVnBCVlRSM1dHRlBRMEZ1UVhkblowcHpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwYWpGbENqaFFZU3RhTDNSeGFtNDJTa2xxTUZscFNXeEJkeTlSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJkWlZVZEJNVlZrUlZGRlFpOTNVamROU0cxSFpESm9NR1JJUW5wUGFUaDJXakpzTUdGSVZtbE1iVTUyWWxNNWVtSklUbWhNVjFwNVdWY3hiQXBrTWpsNVlYazVlbUpJVG1oTVYyUndaRWRvTVZscE1XNWFWelZzWTIxR01HSXpTWFpNYldSd1pFZG9NVmxwT1ROaU0wcHlXbTE0ZG1RelRYWmFNbFoxQ2xwWVNtaGtSemw1V0RKT2RtSnVVbWhoVnpWc1kydzVlbUpJVG1oTmVUVTFZbGQ0UVdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVUnJSME5wYzBjS1FWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc1aFdGSnZaRmRLTVdNeVZubFpNamwxWkVkV2RRcGtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9hVTFxVVRKT2VrNXJDbHBVU210UFIwVjRXbXBHYUZwVVZtdGFSRkpwVGxkRk0wNUhTVEpaYWxKc1dYcEtiRTVIV1RSUFIxSnNUVUkwUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVVLUlVaT1RWVXdSV2RhTWpoblkyMVdjMXBYUm5wYVdFbDNTMUZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVV0psYlhob1dXMXdkMHd6VG5Oak1rVjBZMGhLZGdwa2JWWjFXVmMxYWxwVE1UQmFXRTR3VFVJMFIwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRlNFcHNXbTVOZG1SSFJtNWplVGt5VFVNMGQweHFWWGRuV1c5SENrTnBjMGRCVVZGQ01XNXJRMEpCU1VWbVFWSTJRVWhuUVdSblJHUlFWRUp4ZUhOalVrMXRUVnBJYUhsYVducGpRMjlyY0dWMVRqUTRjbVlyU0dsdVMwRUtUSGx1ZFdwblFVRkJXV0UzUnpSeVNVRkJRVVZCZDBKSVRVVlZRMGxHTUhCQlJXUndlV1JFWjNWc2JXZGxObEowUWtwaWJEQjVSRFpFVjBsTk1IaDBLd281V2pOa2RrbFJTMEZwUlVGbmFtUlFVM0JMUjJsbk56aFBlV1ZVV0hOMFVraFJkRkpVY1dNMFIwMXNRWEp6ZG5CMFoydG9Xbkp6ZDBObldVbExiMXBKQ25wcU1FVkJkMDFFWVVGQmQxcFJTWGRYWTJObFRrRmpORmRSY1d4NVowVlhTVnBHVW1SSFRsTjNZbmxXTUZwUWEwaGtUVGRKU2t4SlRteEVUVXBXVmprS1owY3hSMFZOT0V4bU4zZGpVQ3RRVWtGcVJVRTNhSEZPZEZNM1VESTVjSFZtVEd4TE5UWm5VMVZTZHpReVQxSjFZa1ZhYUZGVU1rODJSVXhFUmxoU1pncEZVM1JWTm5nelkwb3JXV0kwTkd3MlRVSkVhd290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19\",\"integratedTime\":1678176390,\"logIndex\":14849656,\"logID\":\"c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d\"}}",
        "dev.sigstore.cosign/certificate": "-----BEGIN CERTIFICATE-----\nMIIDyzCCA1GgAwIBAgIUQ0mH+A7LwN4WtO6FTL8dQvxvp9MwCgYIKoZIzj0EAwMw\nNzEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MR4wHAYDVQQDExVzaWdzdG9yZS1pbnRl\ncm1lZGlhdGUwHhcNMjMwMzA3MDgwNjI5WhcNMjMwMzA3MDgxNjI5WjAAMFkwEwYH\nKoZIzj0CAQYIKoZIzj0DAQcDQgAEYiZ411SFNKllRAFo/LL7fhlgAGZCxOmsOWd/\n1f+OLsKvWlLTFuZZmX76kacjxU6jD8f6jVFhqr29/hqZAU4wXaOCAnAwggJsMA4G\nA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUij1e\n8Pa+Z/tqjn6JIj0YiIlAw/QwHwYDVR0jBBgwFoAU39Ppz1YkEZb5qNjpKFWixi4Y\nZD8wgYUGA1UdEQEB/wR7MHmGd2h0dHBzOi8vZ2l0aHViLmNvbS9zbHNhLWZyYW1l\nd29yay9zbHNhLWdpdGh1Yi1nZW5lcmF0b3IvLmdpdGh1Yi93b3JrZmxvd3MvZ2Vu\nZXJhdG9yX2NvbnRhaW5lcl9zbHNhMy55bWxAcmVmcy9oZWFkcy9tYWluMDkGCisG\nAQQBg78wAQEEK2h0dHBzOi8vdG9rZW4uYWN0aW9ucy5naXRodWJ1c2VyY29udGVu\ndC5jb20wEgYKKwYBBAGDvzABAgQEcHVzaDA2BgorBgEEAYO/MAEDBChiMjQ2NzNk\nZTJkOGExZjFhZTVkZDRiNWE3NGI2YjRlYzJlNGY4OGRlMB4GCisGAQQBg78wAQQE\nEFNMU0EgZ28gcmVsZWFzZXIwKQYKKwYBBAGDvzABBQQbemxhYmpwL3Nsc2EtcHJv\ndmVuYW5jZS10ZXN0MB4GCisGAQQBg78wAQYEEHJlZnMvdGFncy92MC4wLjUwgYoG\nCisGAQQB1nkCBAIEfAR6AHgAdgDdPTBqxscRMmMZHhyZZzcCokpeuN48rf+HinKA\nLynujgAAAYa7G4rIAAAEAwBHMEUCIF0pAEdpydDgulmge6RtBJbl0yD6DWIM0xt+\n9Z3dvIQKAiEAgjdPSpKGig78OyeTXstRHQtRTqc4GMlArsvptgkhZrswCgYIKoZI\nzj0EAwMDaAAwZQIwWcceNAc4WQqlygEWIZFRdGNSwbyV0ZPkHdM7IJLINlDMJVV9\ngG1GEM8Lf7wcP+PRAjEA7hqNtS7P29pufLlK56gSURw42ORubEZhQT2O6ELDFXRf\nEStU6x3cJ+Yb44l6MBDk\n-----END CERTIFICATE-----\n",
        "dev.sigstore.cosign/chain": "-----BEGIN CERTIFICATE-----\nMIICGjCCAaGgAwIBAgIUALnViVfnU0brJasmRkHrn/UnfaQwCgYIKoZIzj0EAwMw\nKjEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MREwDwYDVQQDEwhzaWdzdG9yZTAeFw0y\nMjA0MTMyMDA2MTVaFw0zMTEwMDUxMzU2NThaMDcxFTATBgNVBAoTDHNpZ3N0b3Jl\nLmRldjEeMBwGA1UEAxMVc2lnc3RvcmUtaW50ZXJtZWRpYXRlMHYwEAYHKoZIzj0C\nAQYFK4EEACIDYgAE8RVS/ysH+NOvuDZyPIZtilgUF9NlarYpAd9HP1vBBH1U5CV7\n7LSS7s0ZiH4nE7Hv7ptS6LvvR/STk798LVgMzLlJ4HeIfF3tHSaexLcYpSASr1kS\n0N/RgBJz/9jWCiXno3sweTAOBgNVHQ8BAf8EBAMCAQYwEwYDVR0lBAwwCgYIKwYB\nBQUHAwMwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQU39Ppz1YkEZb5qNjp\nKFWixi4YZD8wHwYDVR0jBBgwFoAUWMAeX5FFpWapesyQoZMi0CrFxfowCgYIKoZI\nzj0EAwMDZwAwZAIwPCsQK4DYiZYDPIaDi5HFKnfxXx6ASSVmERfsynYBiX2X6SJR\nnZU84/9DZdnFvvxmAjBOt6QpBlc4J/0DxvkTCqpclvziL6BCCPnjdlIB3Pu3BxsP\nmygUY7Ii2zbdCdliiow=\n-----END CERTIFICATE-----\n-----BEGIN CERTIFICATE-----\nMIIB9zCCAXygAwIBAgIUALZNAPFdxHPwjeDloDwyYChAO/4wCgYIKoZIzj0EAwMw\nKjEVMBMGA1UEChMMc2lnc3RvcmUuZGV2MREwDwYDVQQDEwhzaWdzdG9yZTAeFw0y\nMTEwMDcxMzU2NTlaFw0zMTEwMDUxMzU2NThaMCoxFTATBgNVBAoTDHNpZ3N0b3Jl\nLmRldjERMA8GA1UEAxMIc2lnc3RvcmUwdjAQBgcqhkjOPQIBBgUrgQQAIgNiAAT7\nXeFT4rb3PQGwS4IajtLk3/OlnpgangaBclYpsYBr5i+4ynB07ceb3LP0OIOZdxex\nX69c5iVuyJRQ+Hz05yi+UF3uBWAlHpiS5sh0+H2GHE7SXrk1EC5m1Tr19L9gg92j\nYzBhMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRY\nwB5fkUWlZql6zJChkyLQKsXF+jAfBgNVHSMEGDAWgBRYwB5fkUWlZql6zJChkyLQ\nKsXF+jAKBggqhkjOPQQDAwNpADBmAjEAj1nHeXZp+13NWBNa+EDsDP8G1WWg1tCM\nWP/WHPqpaVo0jhsweNFZgSs0eE7wYI4qAjEA2WB9ot98sIkoF3vZYdd3/VtWB5b9\nTNMea7Ix/stJ5TfcLLeABLE4BNJOsQ4vnBHJ\n-----END CERTIFICATE-----",
        "predicateType": "https://slsa.dev/provenance/v0.2"
      }
    }
  ]
}
```

```
$ crane blob ghcr.io/zlabjp/slsa-provenance-test:@sha256:f8cf8a16b23744aa2ff562b4251c026f2218f9871b7b2834d39d8baba9778e4b
```
```json
{
  "payloadType": "application/vnd.in-toto+json",
  "payload": "eyJfdHlwZSI6Imh0dHBzOi8vaW4tdG90by5pby9TdGF0ZW1lbnQvdjAuMSIsInByZWRpY2F0ZVR5cGUiOiJodHRwczovL3Nsc2EuZGV2L3Byb3ZlbmFuY2UvdjAuMiIsInN1YmplY3QiOlt7Im5hbWUiOiJnaGNyLmlvL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdCIsImRpZ2VzdCI6eyJzaGEyNTYiOiIzZGJkNzZmZjZkYzc4OWE4YmZkN2IzMzAzYjE1ZGQ2ZmJhYzA1MmFmNDQyZjgzMGIyZWI1MjdhYjI2OTc2Y2YzIn19XSwicHJlZGljYXRlIjp7ImJ1aWxkZXIiOnsiaWQiOiJodHRwczovL2dpdGh1Yi5jb20vc2xzYS1mcmFtZXdvcmsvc2xzYS1naXRodWItZ2VuZXJhdG9yLy5naXRodWIvd29ya2Zsb3dzL2dlbmVyYXRvcl9jb250YWluZXJfc2xzYTMueW1sQHJlZnMvaGVhZHMvbWFpbiJ9LCJidWlsZFR5cGUiOiJodHRwczovL2dpdGh1Yi5jb20vc2xzYS1mcmFtZXdvcmsvc2xzYS1naXRodWItZ2VuZXJhdG9yL2NvbnRhaW5lckB2MSIsImludm9jYXRpb24iOnsiY29uZmlnU291cmNlIjp7InVyaSI6ImdpdCtodHRwczovL2dpdGh1Yi5jb20vemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0QHJlZnMvdGFncy92MC4wLjUiLCJkaWdlc3QiOnsic2hhMSI6ImIyNDY3M2RlMmQ4YTFmMWFlNWRkNGI1YTc0YjZiNGVjMmU0Zjg4ZGUifSwiZW50cnlQb2ludCI6Ii5naXRodWIvd29ya2Zsb3dzL3Nsc2EtcHJvdmVuYW5jZS55bWwifSwicGFyYW1ldGVycyI6e30sImVudmlyb25tZW50Ijp7ImdpdGh1Yl9hY3RvciI6ImhpeW9zaSIsImdpdGh1Yl9hY3Rvcl9pZCI6Ijk0ODc2MCIsImdpdGh1Yl9iYXNlX3JlZiI6IiIsImdpdGh1Yl9ldmVudF9uYW1lIjoicHVzaCIsImdpdGh1Yl9ldmVudF9wYXlsb2FkIjp7ImFmdGVyIjoiYjI0NjczZGUyZDhhMWYxYWU1ZGQ0YjVhNzRiNmI0ZWMyZTRmODhkZSIsImJhc2VfcmVmIjoicmVmcy9oZWFkcy9tYWluIiwiYmVmb3JlIjoiMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCIsImNvbW1pdHMiOltdLCJjb21wYXJlIjoiaHR0cHM6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9jb21wYXJlL3YwLjAuNSIsImNyZWF0ZWQiOnRydWUsImRlbGV0ZWQiOmZhbHNlLCJmb3JjZWQiOmZhbHNlLCJoZWFkX2NvbW1pdCI6eyJhdXRob3IiOnsiZW1haWwiOiI5NDg3NjArdG91c2FtaUB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20iLCJuYW1lIjoiVG9tb3lhIFVzYW1pIiwidXNlcm5hbWUiOiJoaXlvc2kifSwiY29tbWl0dGVyIjp7ImVtYWlsIjoiOTQ4NzYwK3RvdXNhbWlAdXNlcnMubm9yZXBseS5naXRodWIuY29tIiwibmFtZSI6IlRvbW95YSBVc2FtaSIsInVzZXJuYW1lIjoiaGl5b3NpIn0sImRpc3RpbmN0Ijp0cnVlLCJpZCI6ImIyNDY3M2RlMmQ4YTFmMWFlNWRkNGI1YTc0YjZiNGVjMmU0Zjg4ZGUiLCJtZXNzYWdlIjoiUmV2ZXJ0IHdvcmthcm91bmQiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTA3VDE2OjU5OjQyKzA5OjAwIiwidHJlZV9pZCI6IjY0Mzk1OGRiYjIwMDVhMTU2MzI1YjM3MDk2NWIyY2YyYjE4MGEyY2EiLCJ1cmwiOiJodHRwczovL2dpdGh1Yi5jb20vemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbW1pdC9iMjQ2NzNkZTJkOGExZjFhZTVkZDRiNWE3NGI2YjRlYzJlNGY4OGRlIn0sIm9yZ2FuaXphdGlvbiI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2MDQzODA4P3Y9NCIsImRlc2NyaXB0aW9uIjoiIiwiZXZlbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvZXZlbnRzIiwiaG9va3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9vcmdzL3psYWJqcC9ob29rcyIsImlkIjoxNjA0MzgwOCwiaXNzdWVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvaXNzdWVzIiwibG9naW4iOiJ6bGFianAiLCJtZW1iZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvbWVtYmVyc3svbWVtYmVyfSIsIm5vZGVfaWQiOiJNREV5T2s5eVoyRnVhWHBoZEdsdmJqRTJNRFF6T0RBNCIsInB1YmxpY19tZW1iZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vb3Jncy96bGFianAvcHVibGljX21lbWJlcnN7L21lbWJlcn0iLCJyZXBvc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL29yZ3MvemxhYmpwL3JlcG9zIiwidXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9vcmdzL3psYWJqcCJ9LCJwdXNoZXIiOnsiZW1haWwiOiI5NDg3NjAraGl5b3NpQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbSIsIm5hbWUiOiJoaXlvc2kifSwicmVmIjoicmVmcy90YWdzL3YwLjAuNSIsInJlcG9zaXRvcnkiOnsiYWxsb3dfZm9ya2luZyI6dHJ1ZSwiYXJjaGl2ZV91cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC97YXJjaGl2ZV9mb3JtYXR9ey9yZWZ9IiwiYXJjaGl2ZWQiOmZhbHNlLCJhc3NpZ25lZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvYXNzaWduZWVzey91c2VyfSIsImJsb2JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC9ibG9ic3svc2hhfSIsImJyYW5jaGVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2JyYW5jaGVzey9icmFuY2h9IiwiY2xvbmVfdXJsIjoiaHR0cHM6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC5naXQiLCJjb2xsYWJvcmF0b3JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbGxhYm9yYXRvcnN7L2NvbGxhYm9yYXRvcn0iLCJjb21tZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9jb21tZW50c3svbnVtYmVyfSIsImNvbW1pdHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvY29tbWl0c3svc2hhfSIsImNvbXBhcmVfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvY29tcGFyZS97YmFzZX0uLi57aGVhZH0iLCJjb250ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9jb250ZW50cy97K3BhdGh9IiwiY29udHJpYnV0b3JzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2NvbnRyaWJ1dG9ycyIsImNyZWF0ZWRfYXQiOjE2NzgwNjEwMjgsImRlZmF1bHRfYnJhbmNoIjoibWFpbiIsImRlcGxveW1lbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2RlcGxveW1lbnRzIiwiZGVzY3JpcHRpb24iOm51bGwsImRpc2FibGVkIjpmYWxzZSwiZG93bmxvYWRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2Rvd25sb2FkcyIsImV2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9ldmVudHMiLCJmb3JrIjpmYWxzZSwiZm9ya3MiOjAsImZvcmtzX2NvdW50IjowLCJmb3Jrc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9mb3JrcyIsImZ1bGxfbmFtZSI6InpsYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdCIsImdpdF9jb21taXRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC9jb21taXRzey9zaGF9IiwiZ2l0X3JlZnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvZ2l0L3JlZnN7L3NoYX0iLCJnaXRfdGFnc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9naXQvdGFnc3svc2hhfSIsImdpdF91cmwiOiJnaXQ6Ly9naXRodWIuY29tL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC5naXQiLCJoYXNfZGlzY3Vzc2lvbnMiOmZhbHNlLCJoYXNfZG93bmxvYWRzIjp0cnVlLCJoYXNfaXNzdWVzIjp0cnVlLCJoYXNfcGFnZXMiOmZhbHNlLCJoYXNfcHJvamVjdHMiOnRydWUsImhhc193aWtpIjp0cnVlLCJob21lcGFnZSI6bnVsbCwiaG9va3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaG9va3MiLCJodG1sX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJpZCI6NjEwMDM0NzQ1LCJpc190ZW1wbGF0ZSI6ZmFsc2UsImlzc3VlX2NvbW1lbnRfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaXNzdWVzL2NvbW1lbnRzey9udW1iZXJ9IiwiaXNzdWVfZXZlbnRzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2lzc3Vlcy9ldmVudHN7L251bWJlcn0iLCJpc3N1ZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvaXNzdWVzey9udW1iZXJ9Iiwia2V5c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9rZXlzey9rZXlfaWR9IiwibGFiZWxzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2xhYmVsc3svbmFtZX0iLCJsYW5ndWFnZSI6IkRvY2tlcmZpbGUiLCJsYW5ndWFnZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvbGFuZ3VhZ2VzIiwibGljZW5zZSI6bnVsbCwibWFzdGVyX2JyYW5jaCI6Im1haW4iLCJtZXJnZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvbWVyZ2VzIiwibWlsZXN0b25lc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9taWxlc3RvbmVzey9udW1iZXJ9IiwibWlycm9yX3VybCI6bnVsbCwibmFtZSI6InNsc2EtcHJvdmVuYW5jZS10ZXN0Iiwibm9kZV9pZCI6IlJfa2dET0pGeGtPUSIsIm5vdGlmaWNhdGlvbnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvbm90aWZpY2F0aW9uc3s/c2luY2UsYWxsLHBhcnRpY2lwYXRpbmd9Iiwib3Blbl9pc3N1ZXMiOjAsIm9wZW5faXNzdWVzX2NvdW50IjowLCJvcmdhbml6YXRpb24iOiJ6bGFianAiLCJvd25lciI6eyJhdmF0YXJfdXJsIjoiaHR0cHM6Ly9hdmF0YXJzLmdpdGh1YnVzZXJjb250ZW50LmNvbS91LzE2MDQzODA4P3Y9NCIsImVtYWlsIjpudWxsLCJldmVudHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvZXZlbnRzey9wcml2YWN5fSIsImZvbGxvd2Vyc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9mb2xsb3dlcnMiLCJmb2xsb3dpbmdfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvZm9sbG93aW5ney9vdGhlcl91c2VyfSIsImdpc3RzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwL2dpc3Rzey9naXN0X2lkfSIsImdyYXZhdGFyX2lkIjoiIiwiaHRtbF91cmwiOiJodHRwczovL2dpdGh1Yi5jb20vemxhYmpwIiwiaWQiOjE2MDQzODA4LCJsb2dpbiI6InpsYWJqcCIsIm5hbWUiOiJ6bGFianAiLCJub2RlX2lkIjoiTURFeU9rOXlaMkZ1YVhwaGRHbHZiakUyTURRek9EQTQiLCJvcmdhbml6YXRpb25zX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwL29yZ3MiLCJyZWNlaXZlZF9ldmVudHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvcmVjZWl2ZWRfZXZlbnRzIiwicmVwb3NfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy96bGFianAvcmVwb3MiLCJzaXRlX2FkbWluIjpmYWxzZSwic3RhcnJlZF91cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9zdGFycmVkey9vd25lcn17L3JlcG99Iiwic3Vic2NyaXB0aW9uc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL3psYWJqcC9zdWJzY3JpcHRpb25zIiwidHlwZSI6Ik9yZ2FuaXphdGlvbiIsInVybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvemxhYmpwIn0sInByaXZhdGUiOmZhbHNlLCJwdWxsc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC9wdWxsc3svbnVtYmVyfSIsInB1c2hlZF9hdCI6MTY3ODE3NjAzMiwicmVsZWFzZXNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QvcmVsZWFzZXN7L2lkfSIsInNpemUiOjI5LCJzc2hfdXJsIjoiZ2l0QGdpdGh1Yi5jb206emxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0LmdpdCIsInN0YXJnYXplcnMiOjAsInN0YXJnYXplcnNfY291bnQiOjAsInN0YXJnYXplcnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3RhcmdhemVycyIsInN0YXR1c2VzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L3N0YXR1c2VzL3tzaGF9Iiwic3Vic2NyaWJlcnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3Vic2NyaWJlcnMiLCJzdWJzY3JpcHRpb25fdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3Qvc3Vic2NyaXB0aW9uIiwic3ZuX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJ0YWdzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L3RhZ3MiLCJ0ZWFtc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL3psYWJqcC9zbHNhLXByb3ZlbmFuY2UtdGVzdC90ZWFtcyIsInRvcGljcyI6W10sInRyZWVzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvemxhYmpwL3Nsc2EtcHJvdmVuYW5jZS10ZXN0L2dpdC90cmVlc3svc2hhfSIsInVwZGF0ZWRfYXQiOiIyMDIzLTAzLTA3VDAyOjAzOjMwWiIsInVybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3QiLCJ2aXNpYmlsaXR5IjoicHVibGljIiwid2F0Y2hlcnMiOjAsIndhdGNoZXJzX2NvdW50IjowLCJ3ZWJfY29tbWl0X3NpZ25vZmZfcmVxdWlyZWQiOmZhbHNlfSwic2VuZGVyIjp7ImF2YXRhcl91cmwiOiJodHRwczovL2F2YXRhcnMuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3UvOTQ4NzYwP3Y9NCIsImV2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9ldmVudHN7L3ByaXZhY3l9IiwiZm9sbG93ZXJzX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL2ZvbGxvd2VycyIsImZvbGxvd2luZ191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IiwiZ2lzdHNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9oaXlvc2kvZ2lzdHN7L2dpc3RfaWR9IiwiZ3JhdmF0YXJfaWQiOiIiLCJodG1sX3VybCI6Imh0dHBzOi8vZ2l0aHViLmNvbS9oaXlvc2kiLCJpZCI6OTQ4NzYwLCJsb2dpbiI6ImhpeW9zaSIsIm5vZGVfaWQiOiJNRFE2VlhObGNqazBPRGMyTUE9PSIsIm9yZ2FuaXphdGlvbnNfdXJsIjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9oaXlvc2kvb3JncyIsInJlY2VpdmVkX2V2ZW50c191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9yZWNlaXZlZF9ldmVudHMiLCJyZXBvc191cmwiOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2hpeW9zaS9yZXBvcyIsInNpdGVfYWRtaW4iOmZhbHNlLCJzdGFycmVkX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL3N0YXJyZWR7L293bmVyfXsvcmVwb30iLCJzdWJzY3JpcHRpb25zX3VybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpL3N1YnNjcmlwdGlvbnMiLCJ0eXBlIjoiVXNlciIsInVybCI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvaGl5b3NpIn19LCJnaXRodWJfaGVhZF9yZWYiOiIiLCJnaXRodWJfcmVmIjoicmVmcy90YWdzL3YwLjAuNSIsImdpdGh1Yl9yZWZfdHlwZSI6InRhZyIsImdpdGh1Yl9yZXBvc2l0b3J5X2lkIjoiNjEwMDM0NzQ1IiwiZ2l0aHViX3JlcG9zaXRvcnlfb3duZXIiOiJ6bGFianAiLCJnaXRodWJfcmVwb3NpdG9yeV9vd25lcl9pZCI6IjE2MDQzODA4IiwiZ2l0aHViX3J1bl9hdHRlbXB0IjoiMSIsImdpdGh1Yl9ydW5faWQiOiI0MzUxODk3NTM4IiwiZ2l0aHViX3J1bl9udW1iZXIiOiIzNSIsImdpdGh1Yl9zaGExIjoiYjI0NjczZGUyZDhhMWYxYWU1ZGQ0YjVhNzRiNmI0ZWMyZTRmODhkZSJ9fSwibWV0YWRhdGEiOnsiYnVpbGRJbnZvY2F0aW9uSUQiOiI0MzUxODk3NTM4LTEiLCJjb21wbGV0ZW5lc3MiOnsicGFyYW1ldGVycyI6dHJ1ZSwiZW52aXJvbm1lbnQiOmZhbHNlLCJtYXRlcmlhbHMiOmZhbHNlfSwicmVwcm9kdWNpYmxlIjpmYWxzZX0sIm1hdGVyaWFscyI6W3sidXJpIjoiZ2l0K2h0dHBzOi8vZ2l0aHViLmNvbS96bGFianAvc2xzYS1wcm92ZW5hbmNlLXRlc3RAcmVmcy90YWdzL3YwLjAuNSIsImRpZ2VzdCI6eyJzaGExIjoiYjI0NjczZGUyZDhhMWYxYWU1ZGQ0YjVhNzRiNmI0ZWMyZTRmODhkZSJ9fV19fQ==",
  "signatures": [
    {
      "keyid": "",
      "sig": "MEUCIHUX1qZ7TssTUH4MABePlMYPt9hZ97OldKq0U75I5jBsAiEA2eDS0ePGIFIP+iRTe14xGA+0MhNEmIgYEvzDUmeZWNA="
    }
  ]
}
```

```
$ crane blob ghcr.io/zlabjp/slsa-provenance-test:@sha256:f8cf8a16b23744aa2ff562b4251c026f2218f9871b7b2834d39d8baba9778e4b | jq -r .payload | base64 -d | jq .
```

<details>
<summary>output</summary>

```json
{
  "_type": "https://in-toto.io/Statement/v0.1",
  "predicateType": "https://slsa.dev/provenance/v0.2",
  "subject": [
    {
      "name": "ghcr.io/zlabjp/slsa-provenance-test",
      "digest": {
        "sha256": "3dbd76ff6dc789a8bfd7b3303b15dd6fbac052af442f830b2eb527ab26976cf3"
      }
    }
  ],
  "predicate": {
    "builder": {
      "id": "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_container_slsa3.yml@refs/heads/main"
    },
    "buildType": "https://github.com/slsa-framework/slsa-github-generator/container@v1",
    "invocation": {
      "configSource": {
        "uri": "git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5",
        "digest": {
          "sha1": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de"
        },
        "entryPoint": ".github/workflows/slsa-provenance.yml"
      },
      "parameters": {},
      "environment": {
        "github_actor": "hiyosi",
        "github_actor_id": "948760",
        "github_base_ref": "",
        "github_event_name": "push",
        "github_event_payload": {
          "after": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de",
          "base_ref": "refs/heads/main",
          "before": "0000000000000000000000000000000000000000",
          "commits": [],
          "compare": "https://github.com/zlabjp/slsa-provenance-test/compare/v0.0.5",
          "created": true,
          "deleted": false,
          "forced": false,
          "head_commit": {
            "author": {
              "email": "948760+tousami@users.noreply.github.com",
              "name": "Tomoya Usami",
              "username": "hiyosi"
            },
            "committer": {
              "email": "948760+tousami@users.noreply.github.com",
              "name": "Tomoya Usami",
              "username": "hiyosi"
            },
            "distinct": true,
            "id": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de",
            "message": "Revert workaround",
            "timestamp": "2023-03-07T16:59:42+09:00",
            "tree_id": "643958dbb2005a156325b370965b2cf2b180a2ca",
            "url": "https://github.com/zlabjp/slsa-provenance-test/commit/b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de"
          },
          "organization": {
            "avatar_url": "https://avatars.githubusercontent.com/u/16043808?v=4",
            "description": "",
            "events_url": "https://api.github.com/orgs/zlabjp/events",
            "hooks_url": "https://api.github.com/orgs/zlabjp/hooks",
            "id": 16043808,
            "issues_url": "https://api.github.com/orgs/zlabjp/issues",
            "login": "zlabjp",
            "members_url": "https://api.github.com/orgs/zlabjp/members{/member}",
            "node_id": "MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4",
            "public_members_url": "https://api.github.com/orgs/zlabjp/public_members{/member}",
            "repos_url": "https://api.github.com/orgs/zlabjp/repos",
            "url": "https://api.github.com/orgs/zlabjp"
          },
          "pusher": {
            "email": "948760+hiyosi@users.noreply.github.com",
            "name": "hiyosi"
          },
          "ref": "refs/tags/v0.0.5",
          "repository": {
            "allow_forking": true,
            "archive_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/{archive_format}{/ref}",
            "archived": false,
            "assignees_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/assignees{/user}",
            "blobs_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/blobs{/sha}",
            "branches_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/branches{/branch}",
            "clone_url": "https://github.com/zlabjp/slsa-provenance-test.git",
            "collaborators_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/collaborators{/collaborator}",
            "comments_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/comments{/number}",
            "commits_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/commits{/sha}",
            "compare_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/compare/{base}...{head}",
            "contents_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/contents/{+path}",
            "contributors_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/contributors",
            "created_at": 1678061028,
            "default_branch": "main",
            "deployments_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/deployments",
            "description": null,
            "disabled": false,
            "downloads_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/downloads",
            "events_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/events",
            "fork": false,
            "forks": 0,
            "forks_count": 0,
            "forks_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/forks",
            "full_name": "zlabjp/slsa-provenance-test",
            "git_commits_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/commits{/sha}",
            "git_refs_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/refs{/sha}",
            "git_tags_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/tags{/sha}",
            "git_url": "git://github.com/zlabjp/slsa-provenance-test.git",
            "has_discussions": false,
            "has_downloads": true,
            "has_issues": true,
            "has_pages": false,
            "has_projects": true,
            "has_wiki": true,
            "homepage": null,
            "hooks_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/hooks",
            "html_url": "https://github.com/zlabjp/slsa-provenance-test",
            "id": 610034745,
            "is_template": false,
            "issue_comment_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/comments{/number}",
            "issue_events_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues/events{/number}",
            "issues_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/issues{/number}",
            "keys_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/keys{/key_id}",
            "labels_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/labels{/name}",
            "language": "Dockerfile",
            "languages_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/languages",
            "license": null,
            "master_branch": "main",
            "merges_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/merges",
            "milestones_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/milestones{/number}",
            "mirror_url": null,
            "name": "slsa-provenance-test",
            "node_id": "R_kgDOJFxkOQ",
            "notifications_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/notifications{?since,all,participating}",
            "open_issues": 0,
            "open_issues_count": 0,
            "organization": "zlabjp",
            "owner": {
              "avatar_url": "https://avatars.githubusercontent.com/u/16043808?v=4",
              "email": null,
              "events_url": "https://api.github.com/users/zlabjp/events{/privacy}",
              "followers_url": "https://api.github.com/users/zlabjp/followers",
              "following_url": "https://api.github.com/users/zlabjp/following{/other_user}",
              "gists_url": "https://api.github.com/users/zlabjp/gists{/gist_id}",
              "gravatar_id": "",
              "html_url": "https://github.com/zlabjp",
              "id": 16043808,
              "login": "zlabjp",
              "name": "zlabjp",
              "node_id": "MDEyOk9yZ2FuaXphdGlvbjE2MDQzODA4",
              "organizations_url": "https://api.github.com/users/zlabjp/orgs",
              "received_events_url": "https://api.github.com/users/zlabjp/received_events",
              "repos_url": "https://api.github.com/users/zlabjp/repos",
              "site_admin": false,
              "starred_url": "https://api.github.com/users/zlabjp/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/zlabjp/subscriptions",
              "type": "Organization",
              "url": "https://api.github.com/users/zlabjp"
            },
            "private": false,
            "pulls_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/pulls{/number}",
            "pushed_at": 1678176032,
            "releases_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/releases{/id}",
            "size": 29,
            "ssh_url": "git@github.com:zlabjp/slsa-provenance-test.git",
            "stargazers": 0,
            "stargazers_count": 0,
            "stargazers_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/stargazers",
            "statuses_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/statuses/{sha}",
            "subscribers_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/subscribers",
            "subscription_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/subscription",
            "svn_url": "https://github.com/zlabjp/slsa-provenance-test",
            "tags_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/tags",
            "teams_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/teams",
            "topics": [],
            "trees_url": "https://api.github.com/repos/zlabjp/slsa-provenance-test/git/trees{/sha}",
            "updated_at": "2023-03-07T02:03:30Z",
            "url": "https://github.com/zlabjp/slsa-provenance-test",
            "visibility": "public",
            "watchers": 0,
            "watchers_count": 0,
            "web_commit_signoff_required": false
          },
          "sender": {
            "avatar_url": "https://avatars.githubusercontent.com/u/948760?v=4",
            "events_url": "https://api.github.com/users/hiyosi/events{/privacy}",
            "followers_url": "https://api.github.com/users/hiyosi/followers",
            "following_url": "https://api.github.com/users/hiyosi/following{/other_user}",
            "gists_url": "https://api.github.com/users/hiyosi/gists{/gist_id}",
            "gravatar_id": "",
            "html_url": "https://github.com/hiyosi",
            "id": 948760,
            "login": "hiyosi",
            "node_id": "MDQ6VXNlcjk0ODc2MA==",
            "organizations_url": "https://api.github.com/users/hiyosi/orgs",
            "received_events_url": "https://api.github.com/users/hiyosi/received_events",
            "repos_url": "https://api.github.com/users/hiyosi/repos",
            "site_admin": false,
            "starred_url": "https://api.github.com/users/hiyosi/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/hiyosi/subscriptions",
            "type": "User",
            "url": "https://api.github.com/users/hiyosi"
          }
        },
        "github_head_ref": "",
        "github_ref": "refs/tags/v0.0.5",
        "github_ref_type": "tag",
        "github_repository_id": "610034745",
        "github_repository_owner": "zlabjp",
        "github_repository_owner_id": "16043808",
        "github_run_attempt": "1",
        "github_run_id": "4351897538",
        "github_run_number": "35",
        "github_sha1": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de"
      }
    },
    "metadata": {
      "buildInvocationID": "4351897538-1",
      "completeness": {
        "parameters": true,
        "environment": false,
        "materials": false
      },
      "reproducible": false
    },
    "materials": [
      {
        "uri": "git+https://github.com/zlabjp/slsa-provenance-test@refs/tags/v0.0.5",
        "digest": {
          "sha1": "b24673de2d8a1f1ae5dd4b5a74b6b4ec2e4f88de"
        }
      }
    ]
  }
}
```
</details>
