package jp.co.sjts.util.mail;



/**
 * <br>[機  能] ドメインチェックを行う
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class DomainValidatorJp  {

    /** 追加TLD一覧 */
    private static String[] tldPlus__ = null;
    /** ローカルTLDの許可 */
    private boolean allowLocal__ = false;

    /**
     * Singleton instance of this validator, which
     *  doesn't consider local addresses as valid.
     */
    private static final DomainValidatorJp DOMAIN_VALIDATOR = new DomainValidatorJp(false);

    /**
     * Singleton instance of this validator, which does
     *  consider local addresses valid.
     */
    private static final DomainValidatorJp
        DOMAIN_VALIDATOR_WITH_LOCAL = new DomainValidatorJp(true);

    /**
     * Returns the singleton instance of this validator. It
     *  will not consider local addresses as valid.
     * @return the singleton instance of this validator
     */
    public static synchronized DomainValidatorJp getInstance() {
        return DOMAIN_VALIDATOR;
    }

    /**
     * Returns the singleton instance of this validator,
     *  with local validation as required.
     * @param allowLocal Should local addresses be considered valid?
     * @return the singleton instance of this validator
     */
    public static synchronized DomainValidatorJp getInstance(boolean allowLocal) {
       if (allowLocal) {
          return DOMAIN_VALIDATOR_WITH_LOCAL;
       }
       return DOMAIN_VALIDATOR;
    }

    /**
     * <p>コンストラクタ
     * @param allowLocal ローカルドメインの許可
     */
    private DomainValidatorJp(boolean allowLocal) {
        allowLocal__ = allowLocal;
    }

    /**
     * <br>[機  能] 指定されたドメインのチェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param domain ドメイン
     * @return 判定結果
     */
    public boolean isValid(String domain) {
        __setDomainPlus();

        DomainValidator domainValidator = DomainValidator.getInstance(allowLocal__);
        return domainValidator.isValid(domain);
    }

    /**
     * <br>[機  能] 指定されたトップレベルドメインのチェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param tld トップレベルドメイン
     * @return 判定結果
     */
    public boolean isValidTld(String tld) {
        __setDomainPlus();

        DomainValidator domainValidator = DomainValidator.getInstance(allowLocal__);
        return domainValidator.isValidTld(tld);
    }

    /**
     * <br>[機  能] 許可するTLDの追加を行う
     * <br>[解  説]
     * <br>[備  考] 追加済みの場合、処理を行わない
     */
    private void __setDomainPlus() {
        if (tldPlus__ == null) {
            tldPlus__ = EmailTld.getTldList();
            DomainValidator.updateTLDOverride(DomainValidator.ArrayType.GENERIC_PLUS, tldPlus__);
        }
    }
}
