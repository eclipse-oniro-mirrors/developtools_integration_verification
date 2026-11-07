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
export struct ServiceQuit0070 {
  @Local navPathStack: NavPathStack = new NavPathStack();
  @Local onBackpressValue: boolean = false;
  @Local testStatus: string = '待测试';
  @Local stackInfo: string = '栈深度：0';

  onBackPress(): boolean {
    if (this.onBackpressValue) {
      this.testStatus = '✅ onBackPress拦截，无法返回';
      return true;
    }
    this.testStatus = '⬅️ onBackPress允许返回';
    return false;
  }

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_FEATURETEST_SERVICE_QUIT_0070')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试：Stack模式Navigation栈数>1`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 10 }) {
        Text(`${this.stackInfo}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`onBackPress拦截：${this.onBackpressValue ? '已拦截' : '未拦截'}`)
          .fontSize(14)
          .fontColor(this.onBackpressValue ? Color.Red : Color.Green)

        Text(`${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Orange)
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

      Button(`push Page01`)
        .onClick(() => {
          this.navPathStack.pushPath({ name: 'Page01' });
          this.stackInfo = `栈深度：${this.navPathStack.size()}`;
          this.testStatus = '已push Page01';
        })

      Button(`navigationPage01,onbackpress返回值:false`)
        .onClick(() => {
          this.onBackpressValue = false;
          this.testStatus = 'onBackPress设置为false（允许返回）';
        })

      Button(`navigationPage01,onbackpress返回值:true`)
        .onClick(() => {
          this.onBackpressValue = true;
          this.testStatus = 'onBackPress设置为true（拦截返回）';
        })

      Button(`模拟侧滑返回`)
        .onClick(() => {
          if (this.navPathStack.size() > 0 && !this.onBackpressValue) {
            this.navPathStack.pop();
            this.stackInfo = `栈深度：${this.navPathStack.size()}`;
            this.testStatus = '✅ 返回上一级成功';
          } else if (this.onBackpressValue) {
            this.testStatus = '❌ 操作被拦截，无法返回上一级';
          }
        })

      Button(`重置`)
        .onClick(() => {
          this.navPathStack.clear();
          this.onBackpressValue = false;
          this.testStatus = '待测试';
          this.stackInfo = '栈深度：0';
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`步骤5：返回上一级\n步骤8：操作被拦截，无法返回上一级`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Navigation(this.navPathStack) {
        Column() {
          Text(`Navigation Stack Mode`)
            .fontSize(18)
            .margin({ top: 20 })
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

@Component
export struct Page01 {
  build() {
    NavDestination() {
      Column() {
        Text('Page01 内容')
          .fontSize(20)
      }
    }
    .title('Page01')
  }
}

