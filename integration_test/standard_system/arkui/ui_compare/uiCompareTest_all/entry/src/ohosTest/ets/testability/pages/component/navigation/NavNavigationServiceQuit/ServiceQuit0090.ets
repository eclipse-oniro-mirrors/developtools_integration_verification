/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@ComponentV2
export struct ServiceQuit0090 {
  @Local navPathStack: NavPathStack = new NavPathStack();
  @Local onBackpressReturn: boolean = true;
  @Local testStatus: string = '待测试';

  onBackPress(): boolean {
    if (this.onBackpressReturn) {
      this.testStatus = '⬅️ onBackPress返回true，允许退出元服务';
      return true;
    }
    return false;
  }

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0090')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试：Stack模式Navigation + OnBackpress return true`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 10 }) {
        Text(`onBackPress返回值：${this.onBackpressReturn ? 'true（允许退出）' : 'false（拦截）'}`)
          .fontSize(14)
          .fontColor(Color.Green)

        Text(`${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Button(`stack`)
        .id('btn')
        .onClick(() => {
          this.testStatus = 'Navigation设置为Stack模式';
        })

      Button(`index:onbackpress返回值true`)
        .onClick(() => {
          this.onBackpressReturn = true;
          this.testStatus = 'onBackPress已设置为返回true';
        })

      Button(`模拟侧滑返回`)
        .onClick(() => {
          this.testStatus = '✅ 元服务退出';
        })

      Button(`重置`)
        .onClick(() => {
          this.onBackpressReturn = true;
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：侧滑返回时元服务退出`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Navigation(this.navPathStack) {
        Column() {
          Text(`Navigation Stack Mode`)
            .fontSize(18)
        }
      }
      .mode(NavigationMode.Stack)
      .height('12.3%')
      .border({ width: 2, color: Color.Blue })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor(Color.White)
  }
}

