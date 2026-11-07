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

const TAG = 'RouterInstall007';

@Entry
@ComponentV2
export struct RouterInstall007 {
  @Local statusInfo: string = '等待测试';
  @Local errorCode: string = '';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_007`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：替换页面输入的uri错误或不存在，返回错误码200002`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：使用错误的uri进行router.replace替换`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：替换失败，返回错误码200002`)
          .fontSize(13)
          .fontColor(Color.Green)
          .width('100%')

        Divider()

        Text(this.statusInfo)
          .fontSize(12)
          .fontColor(Color.Orange)
          .width('100%')

        if (this.errorCode) {
          Text(`错误码：${this.errorCode}`)
            .fontSize(12)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .width('100%')
        }

        Divider()

        Button('测试错误URI替换\n（应返回200002）')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              // 使用错误的uri进行replace
              const wrongUri = '@bundle:com.example.hsp/library2/ets/pages/page3_not_exist';
              
              this.statusInfo = '⏳ 正在尝试替换到错误URI...';
              
              await router.replaceUrl({
                url: wrongUri
              });
              
              this.statusInfo = '❌ 意外：替换竟然成功了（不符合预期）';
            } catch (error) {
              const err = error as BusinessError;
              this.errorCode = `${err.code}`;
              
              if (err.code === 200002) {
                this.statusInfo = `✅ 正确：返回错误码200002（replace uri错误）`;
                hilog.info(0x0000, TAG, `Correct error code: 200002`);
              } else {
                this.statusInfo = `⚠️ 返回了其他错误码：${err.code}`;
                hilog.warn(0x0000, TAG, `Unexpected error code: ${err.code}`);
              }
              
              hilog.error(0x0000, TAG, `Router replace error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`错误码200002表示：`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• router.replace的uri错误`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`• 目标替换页面不存在`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`区别于100002（push错误），这是replace专用错误码`)
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

interface BusinessError {
  code: number;
  message: string;
}

