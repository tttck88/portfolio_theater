package com.spring.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
	
	private String username;
    private String password;
    private String authority;
    private String name;
    private boolean enabled;
    
    public void setAuthority(String authority) {
		this.authority = authority;
	}
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(authority));
        return auth;
    }
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String getUsername() {
		return username;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return enabled;
	}
    public String getName() {
        return name;
    }
    public void setName(String name) {
    	this.name = name;
    }
    
	@Override
	public String toString() {
		return "CustomUserDetails [username=" + username + ", password=" + password + ", authority=" + authority
				+ ", enabled=" + enabled + ", name=" + name + "]";
	}
}
