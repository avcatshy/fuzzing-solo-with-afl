## Fuzzing Solo with AFL

---

几个月前在分析某软件的时候`Fuzz` 了下`Aogra`的 [Solo](https://github.com/AgoraIO-Community/Solo) 库<br/>

> Agora Solo 是一个开源语音编解码器，它是基于 Silk 开发的，具有 BWE（带宽扩展）和 MDC（多描述编码）。 借助这些技术，Solo 能够以低比特率抵抗弱网络。

跑出一些崩溃，也简单做了分析，准备提交时发现官方已经在开源的Solo基础上更新了SoloX，并且，`闭源`<br/>

这里记录下`Fuzz` 过程， 参考的是`Proteas` 老哥之前对`SILK`库的Fuzz ，如果对SILK库感兴趣的建议直接移步到该项目。

### 编译

* 克隆Solo的源代码
* 将 `Makefile` 拷贝到 `JC1_SDK_SRC_FLP/build/linux/` 覆盖原始的 `Makefile`。
* 将 `build.sh` 拷贝到 `JC1_SDK_SRC_FLP/build/linux/`。
* 修改 `build.sh` 中的 `PATH_OF_AFL` 指向正确的路径。
* `cd` 到 `JC1_SDK_SRC_FLP/build/linux/` 执行：`./build.sh`。

### Fuzzing

将编译好的`JC1Decoder(or JC1Encoder)`  copy 至配置好的fuzz目录， 根据要fuzz的对象简单修改do-fuzzing.sh ，确定几个路径即可：

* `./do-fuzzing.sh`

---

###  **Furthermore**

* `Fuzzing`的结果也一并放在了fuzz目录，result为decode，result_enc 为encode 感兴趣的自行分析。
* 头铁的兄弟在玩完`Solo`后，可以尝试去下个对应版本SDK，分析一波然后自行写harness 跑一通 ~

