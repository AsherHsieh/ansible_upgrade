# ESS server upgrade plan
Ansible playbook to format filesystem, upgrade centos version, install cuda 10, Docker CE and nvidia-docker plugin on an ESS server.

## Details
* **playbook.yml**
  * 每個role的順序性、相依性的確認? "meta"的使用時機?
    * Role的執行順序會依照我們所排列的順序進行；
    * meta的用意在於確保role的相依性，比方說、某個role必須要先確認docker是否在運行才可執行，就可以把"確認docker的這個role"寫在meta裡面。
    * [Role Dependencies](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#role-dependencies)


* **format /s01 to xfs filesystem**

  * 如何透過ansible 修改檔案內容?  (Done, 使用 lineinfile module)

  * mount/umount 後如何確認成功?  (Done, 檢查 console log是否有錯誤)


  * 確認 /s01 或 /d01 掛載的位置並使用ansible 變數功能操作? (Done)
  * 變數是否可以針對不同的server單獨設定? (Done)
    * 可以在inventory file裡面單獨對server設定變數，也可以針對相同群組做變數設定
  * 當修改文件時，若是條件不符合的情況、該如何處理?
  * 各種錯誤的處理機制? 可以利用handler做rollback嗎?

* **upgrade centos version**

  * 確認當前版本是否已經是 centos 7.3? (Done)

  * 記錄Log: 升級前與升級後的版本 (Done)

  * 是否可以將修改前的文件檔案、以及修改後的文件檔案都抄回control machine? (Done, 使用fetch module )


  * 使用ansible內建的centos相關module確認版本訊息 (Done)

* **Nvidia CUDA 10.0**

  * 是否可以使用yum module找package關鍵字(cuda)做移除?
    * 使用"autoremove"做測試

* **Docker CE**

  * 利用template和vars 製作不同的daemon.json放到不同sever上面 (Done, 利用templates中的j2檔)
  * systemctl 是否有相關的ansible module可以利用? 執行成功或失敗的確認方式? (Done)
    * 使用systemd 這個module，執行結果一樣會有log顯示在console上面

* **nvidia-docker plugin**

  * 如何透過ansible使用"docker"相關的指令? (使用shell module)
  * 最後怎麼確認nvidia-smi? nvcc --version? (使用shell module)

## Usage

Set username in the `vars` bit of the `playbook.yml` file and add ess servers to the `inventory` file. Then simply run the playbook.

`ansible-playbook -i inventory playbook.yml`

