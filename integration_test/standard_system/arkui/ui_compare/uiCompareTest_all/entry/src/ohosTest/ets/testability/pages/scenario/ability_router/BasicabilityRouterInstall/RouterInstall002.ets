/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = 'RouterInstall002';

@Entry
@ComponentV2
export struct RouterInstall002 {
  @Local statusInfo: string = '等待测试';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_002`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Start)

        Divider()

        Text(`测试名称：目标页面共享hsp分包未安装，执行免安装后跳转`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`预置条件：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 已配置服务中心hap（com.ohos.hag.famanager）`)
          .fontSize(12)
          .width('100%')

        Text(`2. HSP模块未安装，已推送到服务中心`)
          .fontSize(12)
          .width('100%')

        Text(`3. 推送命令：hdc file send test.hsp /data/app/el2/100/base/com.ohos.hag.famanager/haps/`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 确认HSP模块未安装`)
          .fontSize(12)
          .width('100%')

        Text(`2. 点击跳转按钮`)
          .fontSize(12)
          .width('100%')

        Text(`3. 系统自动从服务中心下载并安装HSP`)
          .fontSize(12)
          .width('100%')

        Text(`4. 验证跳转是否成功`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：自动免安装后可正常跳转`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        Divider()

        Button('跳转到未安装HSP页面\n（触发免安装）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              // 跳转到未安装的HSP模块
              const hspUri = '@bundle:com.example.hsp/library2/ets/pages/page2';
              
              this.statusInfo = '⏳ 正在触发免安装流程...';
              
              await router.pushUrl({
                url: hspUri
              });
              
              this.statusInfo = '✅ 跳转成功（免安装完成）';
              hilog.info(0x0000, TAG, `On-demand install success: ${hspUri}`);
            } catch (error) {
              this.statusInfo = `❌ 跳转失败：${JSON.stringify(error)}`;
              hilog.error(0x0000, TAG, `On-demand install error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`此测试验证免安装功能：`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• HSP模块未预装，首次跳转时自动下载安装`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• 需要服务中心支持`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• 跳转过程可能较慢（下载+安装）`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

