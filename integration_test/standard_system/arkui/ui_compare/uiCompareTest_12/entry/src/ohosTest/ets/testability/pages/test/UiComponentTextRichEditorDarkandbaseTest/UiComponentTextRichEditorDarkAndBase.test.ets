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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import windowSnap from '../../../model/snapShot'


export default function UiComponentTextRichEditorDarkAndBase() {
  describe('UiComponentTextRichEditorDarkAndBase', () => {

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
      * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00031
      * @tc.name   : Switch dark/light mode when the page with setColorMode remains open
      * @tc.type   : Function
      * @tc.size   : MediumTest
      * @tc.level  : 3
      */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00031", Level.LEVEL3, async (done: Function) => {

      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0031")
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、查找richEditor组件
      let rich_editor_darkandbase_00031 = await driver.findComponent(ON.id("rich_editor_darkandbase_00031"))
      // 2、输入测试文本
      await rich_editor_darkandbase_00031.inputText('1.浅色模式的输入', { paste: false, addition: true });
      await Utils.sleep(1000)
      // 截图查看深色模式文本选中状态


      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }

      // 4、切换为深色模式后输入测试文本
      await rich_editor_darkandbase_00031.inputText('2.深色模式的输入', { paste: false, addition: true });
      // 截图查看深色模式文本选中状态
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00031_01")
      // 5、关闭深色模式
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }

      await rich_editor_darkandbase_00031.inputText('3.恢复浅色模式的输入', { paste: false, addition: true });
      // 截图查看深色模式文本选中状态
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00031_02")
      done();
    })


    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00030
       * @tc.name   : Switch dark/light mode when the page with setColorMode and preset typingstyle remains open
       * @tc.type   : Function
       * @tc.size   : UiTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00030", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0030")
      let driver = await Driver.create()

      // 1、查找richEditor、setTypingStyle组件
      let rich_editor_darkandbase_00030 = await driver.findComponent(ON.id("rich_editor_darkandbase_00030"))
      let button_darkandbase_00030_setTypingStyle = await driver.findComponent(ON.id('button_darkandbase_00030_setTypingStyle'))

      // 2、设置预设样式并输入测试文本
      button_darkandbase_00030_setTypingStyle.click()
      await Utils.sleep(1000)
      await rich_editor_darkandbase_00030.inputText('1.预设样式后输入', { paste: false, addition: true });

      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }

      // 4、切换为深色模式后输入测试文本
      await rich_editor_darkandbase_00030.inputText('2.深色模式的输入', { paste: false, addition: true });
      // 截图查看深色模式文本选中状态
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00030_01")
      // 5、关闭深色模式
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }

      await rich_editor_darkandbase_00030.inputText('3.恢复浅色模式的输入', { paste: false, addition: true });
      // 截图查看深色模式文本选中状态
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_00030_02")
      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0005
       * @tc.name   : Obtain preset styles in different dark/light modes through getTypingStyle
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0005", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0005")
      let driver = await Driver.create()

      // 1、查找richEditor1组件
      let rich_editor_darkandbase_0005 = await driver.findComponent(ON.id("rich_editor_darkandbase_0005"))
      let button_darkandbase_0005_setTypingStyle =
        await driver.findComponent(ON.id('button_darkandbase_0005_setTypingStyle'))
      await rich_editor_darkandbase_0005.inputText("测试1")

      // 2、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0005_01")
            
            await Utils.sleep(1000)

          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }

      await rich_editor_darkandbase_0005.click()
      await rich_editor_darkandbase_0005.inputText("测试2")

      // 3、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0005_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }

      await button_darkandbase_0005_setTypingStyle.click()
      await rich_editor_darkandbase_0005.click()
      await rich_editor_darkandbase_0005.inputText("测试3")
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0005_03")
      await Utils.sleep(1000)


      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0014
        * @tc.name   : The selected background color of selectedBackgroundColor can switch with dark/light mode
        * @tc.type   : Function
        * @tc.size   : MediumTest
        * @tc.level  : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0014", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0014")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 1、查找richEditor组件
      let rich_editor_darkandbase_0014 = await driver.findComponent(ON.id("rich_editor_darkandbase_0014"))

      // 2、输入测试文本选中
      await rich_editor_darkandbase_0014.inputText("这是输入的文本用于提供选中测试")
      await Utils.sleep(2000)
      await rich_editor_darkandbase_0014.longClick()
      await Utils.sleep(1000)

      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0014_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);


      // 4、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0014_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);
      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0003
       * @tc.name   : The text color added by addtextspan follows dark/light mode
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
    */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0003")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 1、查找richEditor组件
      let rich_editor_darkandbase_0003 = await driver.findComponent(ON.id("rich_editor_darkandbase_0003"))
      await rich_editor_darkandbase_0003.click()
      await Utils.sleep(1000)
      // 3、打开深色模式，
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0003_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await Utils.sleep(1000);


      // 4、关闭深色模式，查看文本选中背景
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0003_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);


      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0012
       * @tc.name   : The cursor handle color of caretColor can switch with dark/light mode
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0012", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0012")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 1、查找richEditor组件
      let rich_editor_darkandbase_0012 = await driver.findComponent(ON.id("rich_editor_darkandbase_0012"))
      await Utils.sleep(1000)

      // 2、输入测试文本选中
      await rich_editor_darkandbase_0012.inputText("这是输入的文本用于光标颜色测试")
      await Utils.sleep(2000)
      await rich_editor_darkandbase_0012.longClick()
      await Utils.sleep(1000)

      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0012_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);


      // 4、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0012_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);
      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0017
       * @tc.name   : The decoration line color of decoration follows dark/light mode switching
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0017", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0017")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 1、查找richEditor1组件
      let rich_editor_darkandbase_0017 = await driver.findComponent(ON.id("rich_editor_darkandbase_0017"))
      await Utils.sleep(1000)

      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0017_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }
      rich_editor_darkandbase_0017.click()
      await Utils.sleep(2000);


      // 4、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0017_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }
      await Utils.sleep(2000);
      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0006
       * @tc.name   : The color of addSymbolSpan can switch with dark/light mode
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0006", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0006")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 查找button_addSymbolSpan按钮
      let button_darkandbase_0006_addSymbolSpan = await driver.findComponent(ON.id('button_darkandbase_0006_addSymbolSpan'))
      button_darkandbase_0006_addSymbolSpan.click()
      await Utils.sleep(1000)

      // 3、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            button_darkandbase_0006_addSymbolSpan.click()
            await Utils.sleep(1000)
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0006_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }


      // 4、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            button_darkandbase_0006_addSymbolSpan.click()
            await Utils.sleep(1000)
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0006_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }
      done();
    })

    /*
       * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0016
       * @tc.name   : The shadow color of textShadow follows dark/light mode switching
       * @tc.type   : Function
       * @tc.size   : MediumTest
       * @tc.level  : 3
       */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0016", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorDarkAndBase/UiComponentTextRichEditorDarkAndBase0016")
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // 1、查找richEditor1组件
      let rich_editor_darkandbase_0016 = await driver.findComponent(ON.id("rich_editor_darkandbase_0016"))
      await Utils.sleep(1000)

      // 2、打开深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, async (error) => {
          if (error) {
            console.error('Set dark-mode failed, ' + error.message);
          } else {
            await rich_editor_darkandbase_0016.click()
            await Utils.sleep(1000)
            console.info('Set dark-mode successfully.');
            // 截图查看深色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0016_01")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Set dark-mode failed, ' + message);
      }

      // 3、关闭深色模式，查看效果并截图
      try {
        uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, async (error) => {
          if (error) {
            console.error('Close dark-mode failed, ' + error.message);
          } else {
            console.info('Close dark-mode successfully.');
            await Utils.sleep(1000);
            // 截图查看浅色模式文本选中状态
                  await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0016_02")
            await Utils.sleep(1000)
          }
        })
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error('Close dark-mode failed, ' + message);
      }

      done();
    })


  })
}