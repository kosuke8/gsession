package jp.co.sjts.util.mail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.ResourceBundle;


/**
 * <br>[機  能] メールアドレスに使用可能なTLD取得クラス
 * <br>[解  説] mailTld.propertiesからメールアドレスに使用可能なTLDを取得します。
 * <br>[備  考]
 * @author JTS
 */
public class EmailTld {

    /** プロパティファイル名 */
    private static final String BUNDLE_NAME = "mailTld";

    /** インスタンス */
    private static final ResourceBundle RESOURCE_BUNDLE =
        ResourceBundle.getBundle(BUNDLE_NAME);

    /** TLD一覧 */
    private static String[] tldList__ = null;

    /**
     * <br>[機  能] 空のコンストラクタの禁止
     * <br>[解  説]
     * <br>[備  考]
     * <p>
     */
    private EmailTld() { };

    /**
     * <br>[機  能] トップレベルドメインの一覧を取得する
     * <br>[解  説]
     * <br>[備  考]
     *
     * @return トップレベルドメインの一覧
     */
    public static String[] getTldList() {
        if (tldList__ == null) {
            List<String> tldList = new ArrayList<String>();
            Enumeration<String> tldEnum = RESOURCE_BUNDLE.getKeys();
            while (tldEnum.hasMoreElements()) {
                tldList.add(tldEnum.nextElement());
            }
            tldList__ = (String[]) tldList.toArray(new String[tldList.size()]);
            Arrays.sort(tldList__);
        }

        return tldList__;
    }
}
