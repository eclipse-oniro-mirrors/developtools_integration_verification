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

const TAG = 'Routerpage031';

@Entry
@ComponentV2
export struct Routerpage031 {
  @Local statusInfo: string = '等待测试';
  @Local errorCode: string = '';

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text(`测试用例：SUB_ACE_BASICABILITY_ROUTERPAGE_031`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        Divider()

        Text(`测试名称：应用启动首页，url路径输入有误`)
          .fontSize(13)
          .fontColor(Color.Blue)
          .width('100%')

        Divider()

        Text(`测试步骤：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 在module.json5中配置错误的startWindowIcon路径`)
          .fontSize(12)
          .width('100%')

        Text(`2. 或配置错误的mainElement路径`)
          .fontSize(12)
          .width('100%')

        Text(`3. 启动应用观察行为`)
          .fontSize(12)
          .width('100%')

        Divider()

        Text(`预期结果：应用启动失败或回到默认页面`)
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

        Button('测试跳转错误url')
          .id('btn')
          .width('90%')
          .margin({ top: 20 })
          .onClick(async () => {
            try {
              // 测试跳转到一个不存在的页面
              const wrongUrl = 'pages/NonExistentPage';
              
              this.statusInfo = '⏳ 正在尝试跳转到错误url...';
              
              await router.pushUrl({
                url: wrongUrl
              });
              
              this.statusInfo = '❌ 意外：跳转成功了（不符合预期）';
            } catch (error) {
              const err = error as BusinessError;
              this.errorCode = `${err.code}`;
              this.statusInfo = `✅ 跳转失败（符合预期）：错误码${err.code}`;
              hilog.error(0x0000, TAG, `Router error: ${JSON.stringify(error)}`);
            }
          })

        Text(`说明：`)
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .margin({ top: 20 })

        Text(`此测试用于验证应用配置错误路径时的容错处理`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`module.json5配置示例：`)
          .fontSize(11)
          .fontColor(Color.Gray)
          .width('100%')

        Text(`{
  "abilities": [{
    "name": "EntryAbility",
    "srcEntry": "./ets/entryability/EntryAbility.ets",
    "launchType": "singleton",
    "skills": [{
      "entities": ["entity.system.home"],
      "actions": ["action.system.home"]
    }]
  }]
}`)
          .fontSize(10)
          .fontColor(Color.Gray)
          .fontFamily('monospace')
          .padding(10)
          .backgroundColor('#F0F0F0')
          .borderRadius(4)
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

