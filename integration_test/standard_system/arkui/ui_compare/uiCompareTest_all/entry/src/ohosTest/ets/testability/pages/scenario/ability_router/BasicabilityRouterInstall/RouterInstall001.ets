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

const TAG = 'RouterInstall001';

@Entry
@ComponentV2
export struct RouterInstall001 {
  @Local statusInfo: string = '等待测试';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_001`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Start)

        Divider()

        Text(`测试名称：目标页面共享hsp分包已安装，直接跳转`)
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

        Text(`2. 已安装共享HSP模块`)
          .fontSize(12)
          .width('100%')

        Text(`3. 已配置install_list_capability.json`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 点击跳转按钮`)
          .fontSize(12)
          .width('100%')

        Text(`2. 使用router跳转到共享HSP中的页面`)
          .fontSize(12)
          .width('100%')

        Text(`3. 验证跳转是否成功`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：可正常跳转至HSP中的页面`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        Divider()

        Button('跳转到共享HSP页面')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              // 跳转到共享HSP模块中的页面
              // 实际uri需要根据HSP模块配置调整
              const hspUri = '@bundle:com.example.hsp/library/ets/pages/index';
              
              await router.pushUrl({
                url: hspUri
              });
              
              this.statusInfo = '✅ 跳转请求已发送';
              hilog.info(0x0000, TAG, `Jump to HSP: ${hspUri}`);
            } catch (error) {
              this.statusInfo = `❌ 跳转失败：${JSON.stringify(error)}`;
              hilog.error(0x0000, TAG, `Jump error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`此测试需要预先配置HSP模块和服务中心。`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`如果跳转失败，请确认：`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')
          .margin({ top: 5 })

        Text(`• HSP模块已正确安装`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• install_list_capability.json已配置`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• uri路径与HSP模块配置一致`)
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

