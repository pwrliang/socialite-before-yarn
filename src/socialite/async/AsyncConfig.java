package socialite.async;

import socialite.util.Assert;
import socialite.util.SociaLiteException;

public class AsyncConfig {
    public static final int CHECK_DELTA = 0;
    public static final int CHECK_VALUE = 1;
    private static AsyncConfig asyncConfig;
    private int checkInterval = -1;
    private double threshold;
    private CheckerType checkType;
    private Cond cond;
    private boolean asyncDebug;

    public static AsyncConfig get() {
        if (asyncConfig == null) {
            throw new SociaLiteException("AsyncConfig is not create");
        }
        return asyncConfig;
    }

    public void setAsyncDebug() {
        asyncDebug = true;
    }

    public boolean isAsyncDebug() {
        return asyncDebug;
    }

    public int getCheckInterval() {
        return checkInterval;
    }

    public double getThreshold() {
        return threshold;
    }

    public CheckerType getCheckType() {
        return checkType;
    }

    public String getCond() {
        switch (cond) {
            case G:
                return ">";
            case GE:
                return ">=";
            case E:
                return "=";
            case LE:
                return "<=";
            case L:
                return "<";
        }
        Assert.impossible();
        return null;
    }

    public enum Cond {
        G, GE, E, L, LE
    }

    public enum CheckerType {
        VALUE, DELTA
    }

    public static class Builder {
        private int checkInterval = -1;
        private Double threshold = null;
        private CheckerType checkType;
        private Cond cond;

        public Builder setCheckerType(CheckerType checkType) {
            this.checkType = checkType;
            return this;
        }

        public Builder setCheckInterval(int checkInterval) {
            this.checkInterval = checkInterval;
            return this;
        }

        public Builder setThreshold(double threshold) {
            this.threshold = threshold;
            return this;
        }

        public Builder setCheckerCond(Cond cond) {
            this.cond = cond;
            return this;
        }

        public AsyncConfig build() {
            AsyncConfig asyncConfig = new AsyncConfig();
            if (threshold == null)
                throw new SociaLiteException("threshold is not set");
            if (checkType == null)
                throw new SociaLiteException("check type is not set");
            if (cond == null)
                throw new SociaLiteException("condition is not set");
            asyncConfig.checkInterval = checkInterval;
            asyncConfig.threshold = threshold;
            asyncConfig.checkType = checkType;
            asyncConfig.cond = cond;
            AsyncConfig.asyncConfig = asyncConfig;
            return asyncConfig;
        }
    }
}
