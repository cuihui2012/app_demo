package com.bird.business.cache;

import com.bird.business.utils.JedisUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.SerializationUtils;
import java.util.Collection;
import java.util.Set;

@Component
public class RedisCache<K, V> implements Cache<K, V> {

    private  static  final Logger logger = LoggerFactory.getLogger(RedisCache.class);

    @Autowired
    private JedisUtil jedisUtil;

    //cache前缀
    private final String CACHE_PREFIX = "auth-cache:";

    private byte[] getKey(K k) {
        return (CACHE_PREFIX + k).getBytes();
    }

    @Override
    public V get(K k) throws CacheException {
        logger.info("从RedisCache中获取授权信息");
        byte[] value = jedisUtil.get(getKey(k));
        if (value != null) {
            return (V) SerializationUtils.deserialize(value);
        }
        return null;
    }

    @Override
    public V put(K k, V v) throws CacheException {
        //角色/权限放在同一个key中,可通过日志看出
        byte[] key = getKey(k);
        byte[] value = SerializationUtils.serialize(v);
        jedisUtil.set(key, value);
        //设置超时时间,10分钟
        jedisUtil.expire(key, 600);
        return v;
    }

    @Override
    public V remove(K k) throws CacheException {
        byte[] key = getKey(k);
        byte[] value = jedisUtil.get(key);
        jedisUtil.delete(key);
        if(value != null) {
            return (V) SerializationUtils.deserialize(value);
        }
        return null;
    }

    @Override
    public void clear() throws CacheException {
        //不需要重写,因为redis中放的不止是权限缓存,还有session缓存
    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Set<K> keys() {
        return null;
    }

    @Override
    public Collection<V> values() {
        return null;
    }
}
