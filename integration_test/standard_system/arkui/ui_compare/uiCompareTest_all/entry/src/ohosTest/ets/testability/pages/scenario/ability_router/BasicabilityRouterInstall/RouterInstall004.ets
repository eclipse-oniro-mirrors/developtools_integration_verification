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

const TAG = 'RouterInstall004';

@Entry
@ComponentV2
export struct RouterInstall004 {
  @Local statusInfo: string = '等待测试';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_004`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：目标页面hap分包未安装，执行免安装后跳转`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`预置条件：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. HAP分包未安装，已推送到服务中心`)
          .fontSize(12)
          .width('100%')

        Text(`2. 推送命令：hdc file send test.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Divider()

        Text(`测试步骤：触发免安装，自动下载并安装HAP分包`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

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

        Button('跳转到未安装HAP分包\n（触发免安装）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              const hapUri = '@bundle:com.example.application2/application2/ets/pages/page2';
              
              this.statusInfo = '⏳ 正在触发免安装流程...';
              
              await router.pushUrl({
                url: hapUri
              });
              
              this.statusInfo = '✅ 免安装成功并跳转';
              hilog.info(0x0000, TAG, `On-demand install HAP success: ${hapUri}`);
            } catch (error) {
              this.statusInfo = `❌ 免安装失败：${JSON.stringify(error)}`;
              hilog.error(0x0000, TAG, `On-demand install HAP error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：此测试验证HAP分包免安装功能`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
          .margin({ top: 20 })
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

