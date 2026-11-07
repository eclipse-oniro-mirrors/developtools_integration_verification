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

const TAG = 'RouterInstall003';

@Entry
@ComponentV2
export struct RouterInstall003 {
  @Local statusInfo: string = '等待测试';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_003`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：目标页面hap分包已安装，直接跳转`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`预置条件：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 已安装目标HAP分包（application模块）`)
          .fontSize(12)
          .width('100%')

        Text(`2. 已配置服务中心和install_list_capability.json`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`测试步骤：点击跳转到已安装的HAP分包页面`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：可正常跳转至HAP分包页面`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        Divider()

        Button('跳转到HAP分包页面')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              const hapUri = '@bundle:com.example.application/application/ets/pages/index';
              
              await router.pushUrl({
                url: hapUri
              });
              
              this.statusInfo = '✅ 跳转成功';
              hilog.info(0x0000, TAG, `Jump to HAP: ${hapUri}`);
            } catch (error) {
              this.statusInfo = `❌ 跳转失败：${JSON.stringify(error)}`;
              hilog.error(0x0000, TAG, `Jump error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：此测试验证跨HAP分包路由功能`)
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

